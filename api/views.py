from django.shortcuts import render

from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model
from .models import UserProfile, Medication, HealthCondition, MealPlan, Appointment, Audio, CustomUser
from .serializers import UserSerializer,UserProfileSerializer, MedicationSerializer, HealthConditionSerializer, MealPlanSerializer, AppointmentSerializer, AudioSerializer

from .utils import transcribe_audio
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.permissions import AllowAny, IsAuthenticated

import random
from django.core.mail import send_mail
from rest_framework.views import APIView

from djoser.signals import user_registered
from djoser.views import UserViewSet


# Using Djoser's activation email
# class UserCreateViewSet(UserViewSet):
#     def perform_create(self, serializer):
#         user = serializer.save()
#         user.is_active = False  # Deactivate the user until they verify their email
#         user.verification_code = str(random.randint(100000, 999999))  # Generate a 6-digit code
#         print(f"Generated verification code for {user.email}: {user.verification_code}")  # Print the code
#         user.save()

#         # Trigger Djoser's activation email
#         user_registered.send(sender=self.__class__, user=user, request=self.request)
#         print("Triggered the user registered signal.")

#         return Response({'detail': 'Verification code sent to your email.'}, status=status.HTTP_201_CREATED)


# Using custom email sending
class UserCreateViewSet(viewsets.ModelViewSet):
    serializer_class = UserSerializer
    queryset = CustomUser.objects.all()

    def get_permissions(self):
        if self.action == 'create':
            # Allow unauthenticated users to access the POST request (sign-up)
            return [AllowAny()]
        else:
            # Restrict other requests (like GET) to authenticated users only
            return [IsAuthenticated()]

    def perform_create(self, serializer):
        user = serializer.save()
        user.is_active = False  # Deactivate the user until they verify their email
        user.verification_code = str(random.randint(100000, 999999))  # Generate a 6-digit code
        print(f"Generated verification code for {user.email}: {user.verification_code}")  # Print the code
        user.save()

        # Send the verification code via email
        send_mail(
            'Verify your account',
            f'Your verification code is {user.verification_code}',
            'husseinkhidr3@gmail.com',
            [user.email],
            fail_silently=False,
        )

        return Response({'detail': 'Verification code sent to your email.'}, status=status.HTTP_201_CREATED)


class VerifyEmailView(APIView):
    def post(self, request, *args, **kwargs):
        email = request.data.get('email')
        verification_code = request.data.get('verification_code')

        try:
            user = CustomUser.objects.get(email=email, verification_code=verification_code)
            if user.is_verified:
                return Response({'detail': 'User is already verified.'}, status=status.HTTP_400_BAD_REQUEST)
            
            user.is_verified = True
            user.is_active = True  # Activate the user account
            user.verification_code = ''  # Clear the verification code
            user.save()

            return Response({'detail': 'Email verified successfully.'}, status=status.HTTP_200_OK)
        
        except CustomUser.DoesNotExist:
            return Response({'detail': 'Invalid verification code or email.'}, status=status.HTTP_400_BAD_REQUEST)


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