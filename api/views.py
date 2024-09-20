from django.shortcuts import render
from rest_framework import viewsets, status
from rest_framework.response import Response
from django.contrib.auth import get_user_model
from .models import UserProfile, Medication, HealthCondition, MealPlan, Appointment, Audio, CustomUser
from .serializers import (
    UserSerializer, UserProfileSerializer, MedicationSerializer, 
    HealthConditionSerializer, MealPlanSerializer, AppointmentSerializer, AudioSerializer
)
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.views import APIView
from django.core.mail import send_mail
from djoser.signals import user_registered
from rag_implementation.rag_main import rag_response
from rag_implementation.speech_io import transcribe_audio
from rag_implementation.config.database import collection
from django.http import HttpResponse
import random, tempfile, os


class UserCreateViewSet(viewsets.ModelViewSet):
    """
    Handles user creation with email verification.
    """
    serializer_class = UserSerializer
    queryset = CustomUser.objects.all()

    def get_permissions(self):
        if self.action == 'create':
            return [AllowAny()]
        return [IsAuthenticated()]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save(is_active=False)
        user.verification_code = str(random.randint(100000, 999999))
        user.save()

        try:
            send_mail(
                'Verify your account',
                f'Your verification code is {user.verification_code}',
                'husseinkhidr3@gmail.com',
                [user.email],
                fail_silently=False,
            )
            print(f"Verification code {user.verification_code} sent to {user.email}")

            response_data = {
                "status": "success",
                "data": {
                    "user": {
                        "email": user.email,
                        "username": user.username
                    }
                },
                "message": "Verification code sent to your email."
            }

            print(response_data)  # This will log the exact response data
            return Response(response_data, status=status.HTTP_201_CREATED)

        except Exception as e:
            print(f"Error sending email: {e}")
            response_data = {
                "status": "fail",
                "message": "Error sending verification email."
            }
            return Response(response_data, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



class VerifyEmailView(APIView):
    """
    Verifies user email by checking the provided verification code.
    """
    def post(self, request, *args, **kwargs):
        email = request.data.get('email')
        verification_code = request.data.get('verification_code')

        try:
            user = CustomUser.objects.get(email=email, verification_code=verification_code)
            if user.is_verified:
                response_data = {
                    "status": "fail",
                    "message": "User is already verified."
                }
                return Response(response_data, status=status.HTTP_400_BAD_REQUEST)
            
            user.is_verified = True
            user.is_active = True
            user.verification_code = ''
            user.save()

            response_data = {
                "status": "success",
                "message": "Email verified successfully."
            }
            return Response(response_data, status=status.HTTP_200_OK)

        except CustomUser.DoesNotExist:
            response_data = {
                "status": "fail",
                "message": "Invalid verification code or email."
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)


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
    """
    Handles audio uploads, transcriptions, and AI response generation.
    """
    queryset = Audio.objects.all()
    serializer_class = AudioSerializer
    parser_classes = [MultiPartParser, FormParser]

    def perform_create(self, serializer):
        instance = serializer.save(user=self.request.user)
        postgres_user = self.request.user
        mongo_user = self.get_or_create_mongo_user(postgres_user)

        return self.process_audio(instance, mongo_user)

    def get_or_create_mongo_user(self, postgres_user):
        new_user = {
            'name': postgres_user.username,
            'email_address': postgres_user.email,
            'full_history': [],
            'buffer_history': []
        }

        mongo_user = collection.find_one({"email_address": new_user["email_address"]})
        if not mongo_user:
            result = collection.insert_one(new_user)
            mongo_user = collection.find_one({"_id": result.inserted_id})

        return mongo_user

    def process_audio(self, instance, mongo_user):
        audio_file = self.request.FILES.get('audio_file')
        if not audio_file or audio_file.size == 0:
            response_data = {
                "status": "fail",
                "message": "Audio file is required and cannot be empty."
            }
            return Response(response_data, status=400)

        try:
            with tempfile.NamedTemporaryFile(delete=False, suffix='.opus') as temp_audio_file:
                audio_file.seek(0)
                temp_audio_file.write(audio_file.read())
                temp_audio_file.flush()

            transcription = transcribe_audio(temp_audio_file.name)
            if not transcription:
                raise ValueError("Transcription failed.")
            
            instance.transcription = transcription
            instance.save()

            ai_result = rag_response(
                user_id=str(mongo_user['_id']),
                query=transcription,
                knowledge_base="some_knowledge_base"
            )
            if not ai_result or 'response' not in ai_result:
                raise ValueError("AI response failed.")
            
            instance.ai_response = ai_result['response']
            instance.save()

            response_data = {
                "status": "success",
                "data": {
                    "ai_response": ai_result['response']
                },
                "message": "Audio processed successfully."
            }
            return Response(response_data, status=200)

        except Exception as e:
            print(f"Error during audio processing: {e}")
            response_data = {
                "status": "fail",
                "message": "Audio processing failed."
            }
            return Response(response_data, status=500)

        finally:
            if os.path.exists(temp_audio_file.name):
                os.remove(temp_audio_file.name)
