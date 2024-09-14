from django.shortcuts import render

from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model
from .models import UserProfile, Medication, HealthCondition, MealPlan, Appointment, Audio, CustomUser
from .serializers import UserSerializer,UserProfileSerializer, MedicationSerializer, HealthConditionSerializer, MealPlanSerializer, AppointmentSerializer, AudioSerializer

# from .utils import transcribe_audio
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.permissions import AllowAny, IsAuthenticated

import random
from django.core.mail import send_mail
from rest_framework.views import APIView

from djoser.signals import user_registered
from djoser.views import UserViewSet

from rag_implementation.rag_main import rag_response
from rag_implementation.speech_io import synthesize_speech, transcribe_audio
import os
from django.http import HttpResponse, JsonResponse
import tempfile

from rag_implementation.rag_main import get_user_by_email, create_user, User
from rag_implementation.config.database import collection

from io import BytesIO
import io
import time


# Using Djoser's activation email
# class UserCreateViewSet(UserViewSet):
#     def perform_create(self, serializer):
#         user = serializer.save()
#         user.is_active = False  # Deactivate the user until they verify the OTP
#         user.verification_code = str(random.randint(100000, 999999))  # Generate a 6-digit OTP
#         user.save()

#         # Send the OTP via email
#         send_mail(
#             'Verify your account',
#             f'Your OTP verification code is {user.verification_code}',
#             'noreply@yourdomain.com',  # Change to your sender email
#             [user.email],
#             fail_silently=False,
#         )

#         return Response({'detail': 'OTP sent to your email.'}, status=status.HTTP_201_CREATED)


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

    # def perform_create(self, serializer):
    #     user = serializer.save()
    #     user.is_active = False  # Deactivate the user until they verify their email
    #     user.verification_code = str(random.randint(100000, 999999))  # Generate a 6-digit code
    #     print(f"Generated verification code for {user.email}: {user.verification_code}")  # Print the code
    #     user.save()

    #     # Send the verification code via email
    #     send_mail(
    #         'Verify your account',
    #         f'Your verification code is {user.verification_code}',
    #         'husseinkhidr3@gmail.com',
    #         [user.email],
    #         fail_silently=False,
    #     )

    #     return Response({'detail': 'Verification code sent to your email.'}, status=status.HTTP_201_CREATED)

    def perform_create(self, serializer):
        user = serializer.save()
        user.is_active = False  # Deactivate the user until they verify their email
        user.verification_code = str(random.randint(100000, 999999))  # Generate a 6-digit code
        print(f"Generated verification code for {user.email}: {user.verification_code}")  # Print the code
        user.save()

        try:
            # Send the verification code via email
            send_mail(
                'Verify your account',
                f'Your verification code is {user.verification_code}',
                'husseinkhidr3@gmail.com',
                [user.email],
                fail_silently=False,
            )
            print("Email sent successfully.")

        except Exception as e:
            print(f"Error sending email: {e}")

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
        # Save the audio instance and associate the user in PostgreSQL
        instance = serializer.save(user=self.request.user)

        # Ensure that a MongoDB user is created or fetched using existing functions
        postgres_user = self.request.user
        mongo_user = self.get_or_create_mongo_user(postgres_user)

        # Return the result of process_audio which returns the audio response
        return self.process_audio(instance, mongo_user)
    

    def get_or_create_mongo_user(self, postgres_user):
        # Construct the new_user object here
        new_user = {
            'name': postgres_user.username,
            'email_address': postgres_user.email,
            'full_history': [],
            'buffer_history': []
            # Add other fields as necessary
        }

        # First, try to find the user in MongoDB
        mongo_user = collection.find_one({"email_address": new_user["email_address"]})
        
        # If user is found
        if mongo_user:
            # print(f"MongoDB user found: {mongo_user}")  # Log for debugging
            pass
        else:
            # If user not found, create a new MongoDB user
            result = collection.insert_one(new_user)
            mongo_user = collection.find_one({"_id": result.inserted_id})  # Retrieve newly created document
            print(f"Inserted new MongoDB user with _id: {result.inserted_id}")

        # Safely handle the _id field
        user_id = mongo_user.get('_id')
        if not user_id:
            raise KeyError("'_id' field is missing in the retrieved MongoDB document")
        
        return mongo_user

    # def process_audio(self, instance, mongo_user):
    #     # Get the uploaded audio file
    #     audio_file = self.request.FILES.get('audio_file')
    #     if not audio_file:
    #         return Response({'error': 'Audio file is required'}, status=400)

    #     print(f"Processing file: {audio_file.name}, size: {audio_file.size}")

    #     # Ensure that the file is not empty by checking size
    #     if audio_file.size == 0:
    #         return Response({'error': 'Audio file is empty'}, status=400)

    #     # Create a temporary file for the audio
    #     temp_audio_path = None
    #     try:
    #         with tempfile.NamedTemporaryFile(delete=False, suffix='.opus') as temp_audio_file:
    #             temp_audio_path = temp_audio_file.name
    #             audio_file.seek(0)  # Ensure pointer is at the beginning of the file
    #             temp_audio_file.write(audio_file.read())
    #             temp_audio_file.flush()
    #             print(f"Temporary file created at: {temp_audio_path}")

    #         # Transcribe the audio using the temporary file path
    #         transcription = transcribe_audio(temp_audio_path)
    #         if not transcription:
    #             raise ValueError("Transcription is empty or failed.")
    #         print(f"Transcription: {transcription}")

    #         # Save transcription and proceed with other steps
    #         instance.transcription = transcription
    #         instance.save()

    #         # Further AI processing, sending transcription to the model for response
    #         ai_result = rag_response(
    #             user_id=str(mongo_user['_id']),  # MongoDB ObjectId
    #             query=transcription,
    #             knowledge_base="some_knowledge_base"
    #         )
    #         if not ai_result or 'response' not in ai_result:
    #             raise ValueError("AI response is empty or missing.")
    #         print(f"AI Response: {ai_result['response']}")

    #         instance.ai_response = ai_result['response']
    #         instance.save()

    #         # Create audio response from LLM response
    #         synthesized_audio = synthesize_speech(text=ai_result['response'], file_prefix=f"user_{self.request.user.id}")
    #         print("Synthesized audio generated.")

    #         # Send the synthesized audio in the response
    #         response = HttpResponse(synthesized_audio, content_type='audio/mpeg')
    #         response['Content-Disposition'] = 'inline; filename="response.mp3"'

    #         return response

    #     except Exception as e:
    #         print(f"Error during processing or transcription: {e}")
    #         return Response({'error': 'Error during processing or transcription'}, status=500)

    #     finally:
    #         # Clean up: Delete the temporary audio file after processing
    #         if temp_audio_path and os.path.exists(temp_audio_path):
    #             os.remove(temp_audio_path)
    #             print(f"Temporary file {temp_audio_path} deleted.")

    def process_audio(self, instance, mongo_user):
        # Get the uploaded audio file
        audio_file = self.request.FILES.get('audio_file')
        if not audio_file:
            return Response({'error': 'Audio file is required'}, status=400)

        print(f"Processing file: {audio_file.name}, size: {audio_file.size}")

        if audio_file.size == 0:
            return Response({'error': 'Audio file is empty'}, status=400)

        temp_audio_path = None
        try:
            # Create a temporary file for the uploaded audio
            with tempfile.NamedTemporaryFile(delete=False, suffix='.opus') as temp_audio_file:
                temp_audio_path = temp_audio_file.name
                audio_file.seek(0)
                temp_audio_file.write(audio_file.read())
                temp_audio_file.flush()

            # Transcribe the audio
            transcription = transcribe_audio(temp_audio_path)
            if not transcription:
                raise ValueError("Transcription is empty or failed.")
            print(f"Transcription: {transcription}")

            # Save transcription to the instance
            instance.transcription = transcription
            instance.save()

            # AI model response
            ai_result = rag_response(
                user_id=str(mongo_user['_id']),
                query=transcription,
                knowledge_base="some_knowledge_base"
            )
            if not ai_result or 'response' not in ai_result:
                raise ValueError("AI response is empty or missing.")
            print(f"AI Response: {ai_result['response']}")

            # Save AI response to the instance
            instance.ai_response = ai_result['response']
            instance.save()

            # Synthesize the audio response from the AI response
            file_prefix = f"user_{self.request.user.id}"
            synthesized_audio = synthesize_speech(text=ai_result['response'], file_prefix=file_prefix)
            print("Synthesized audio generated.")

            # Send the synthesized audio as a direct response
            if synthesized_audio:
                response = HttpResponse(synthesized_audio, content_type='audio/wav')
                response['Content-Disposition'] = 'inline; filename="response.wav"'
                return response

        except Exception as e:
            print(f"Error during processing or transcription: {e}")
            return Response({'error': 'Error during processing or transcription'}, status=500)

        finally:
            # Clean up: Delete the temporary audio file after processing
            if temp_audio_path and os.path.exists(temp_audio_path):
                time.sleep(1)  # Add delay to allow file access release
                os.remove(temp_audio_path)
                print(f"Temporary file {temp_audio_path} deleted.")