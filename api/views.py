from django.shortcuts import render

from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import status
from .models import User, UserProfile, Medication, HealthCondition, MealPlan, Appointment, Audio
from .serializers import UserSerializer,UserProfileSerializer, MedicationSerializer, HealthConditionSerializer, MealPlanSerializer, AppointmentSerializer, AudioSerializer

from .utils import transcribe_audio
from rest_framework.parsers import MultiPartParser, FormParser

class UserCreateViewSet(viewsets.ModelViewSet):
    serializer_class = UserSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

class UserProfileViewSet(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer

class MedicationViewSet(viewsets.ModelViewSet):
    queryset = Medication.objects.all()
    serializer_class = MedicationSerializer

class HealthConditionViewSet(viewsets.ModelViewSet):
    queryset = HealthCondition.objects.all()
    serializer_class = HealthConditionSerializer

class MealPlanViewSet(viewsets.ModelViewSet):
    queryset = MealPlan.objects.all()
    serializer_class = MealPlanSerializer

class AppointmentViewSet(viewsets.ModelViewSet):
    queryset = Appointment.objects.all()
    serializer_class = AppointmentSerializer


class AudioViewSet(viewsets.ModelViewSet):
    queryset = Audio.objects.all()
    serializer_class = AudioSerializer
    parser_classes = [MultiPartParser, FormParser]

    def perform_create(self, serializer):
        # This method will be called upon creation, so we can handle audio processing here
        instance = serializer.save(user=self.request.user)  # Save the instance first
        self.process_audio(instance)

    def process_audio(self, instance):
        # Logic for sending the audio file for transcription and saving the result
        transcription = transcribe_audio(instance.audio_file.path)  # Assuming a function transcribe_audio exists
        instance.transcription = transcription
        instance.save()