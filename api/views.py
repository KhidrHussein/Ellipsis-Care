from django.shortcuts import render
from djoser.views import UserViewSet, TokenCreateView
from rest_framework import viewsets, status, permissions
from rest_framework.response import Response
from django.contrib.auth import get_user_model, authenticate
from .models import UserProfile, Medication, HealthCondition, MealPlan, Appointment, Audio, CustomUser
from .serializers import (
    UserSerializer, UserProfileSerializer, MedicationSerializer, 
    HealthConditionSerializer, MealPlanSerializer, AppointmentSerializer, AudioSerializer, ReminderSerializer, CustomTokenCreateSerializer, UpdateProfileSerializer, ChangePasswordSerializer, TotalUsersSerializer
)
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.views import APIView
from django.core.mail import send_mail
from djoser.signals import user_registered
from rag_implementation.rag_main import rag_response, reminder_message_full
from rag_implementation.speech_io import transcribe_audio ,synthesize_speech
from rag_implementation.config.database import collection
from django.http import HttpResponse, StreamingHttpResponse, FileResponse, JsonResponse
import random, tempfile, os
from asgiref.sync import async_to_sync
from .utils import get_or_create_mongo_user, HealthSyncScoreCalculator

from django.core.mail import EmailMessage
from django.conf import settings
from django.core.exceptions import ValidationError
from django.db.utils import IntegrityError

from django.core.mail import send_mail
from django.conf import settings
from rest_framework import status
from rest_framework.response import Response
import random
import logging
from django.core.cache import cache
from pydub import AudioSegment
from wsgiref.util import FileWrapper

logger = logging.getLogger(__name__)


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
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)

            # Save the user but set them inactive until they verify
            user = serializer.save(is_active=False)
            user.verification_code = str(random.randint(100000, 999999))
            print(user.verification_code)  # Debug: print the verification code
            user.save()

            # Send the verification email
            email = EmailMessage(
                subject='Verify your account',
                body=f'Your verification code is {user.verification_code}',
                from_email=settings.DEFAULT_FROM_EMAIL,
                to=[user.email],
            )
            email.extra_headers = {'X-PM-Message-Stream': 'outbound'}
            email.send(fail_silently=False)

            response_data = {
                "status": "success",
                "message": "Verification code sent to your email.",
                "data": {
                    "user": {
                        "email": user.email,
                        "username": user.first_name,
                        "otp": user.verification_code,
                        "first_name": user.first_name,
                        "last_name": user.last_name
                    }
                }
            }
            return Response(response_data, status=status.HTTP_201_CREATED)

        except ValidationError as e:
            # Handle validation errors (e.g., user already exists)
            response_data = {
                "status": "fail",
                "message": "User with this email already exists.",
                "data": {}
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

        except Exception as e:
            import traceback
            print(f"Error sending email: {e}")
            
            response_data = {
                "status": "fail",
                "message": "Error sending verification email.",
                "data": {}
            }
            return Response(response_data, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class VerifyEmailView(APIView):
    """
    Verifies user email by checking the provided verification code.
    """
    permission_classes = [AllowAny]  # Allow access without authentication

    def post(self, request, *args, **kwargs):
        email = request.data.get('email')
        verification_code = request.data.get('verification_code')

        print(f"Verification attempt with email: {email} and code: {verification_code}")  # Log input

        # Validate input data
        if not email or not verification_code:
            response_data = {
                "status": "fail",
                "message": "Both email and verification code are required."
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Fetch the user based on email and verification code
            user = CustomUser.objects.get(email=email, verification_code=verification_code)

            # Check if the user is already verified
            if user.is_active:
                response_data = {
                    "status": "fail",
                    "message": "This email address has already been verified. Please log in."
                }
                return Response(response_data, status=status.HTTP_400_BAD_REQUEST)
            
            # Proceed to verify the user's email
            user.is_verified = True
            user.is_active = True
            user.verification_code = ''
            user.save()

            response_data = {
                "status": "success",
                "message": "Email verified successfully! You can now log in."
            }
            return Response(response_data, status=status.HTTP_200_OK)

        except CustomUser.DoesNotExist:
            print("User not found with provided email or verification code.")  # Log error
            response_data = {
                "status": "fail",
                "message": "No account found with the provided email address and verification code. Please check your input or request a new verification code."
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

        except Exception as e:
            print("An unexpected error occurred:", str(e))  # Log unexpected errors
            response_data = {
                "status": "fail",
                "message": "An unexpected error occurred while verifying your email. Please try again later."
            }
            return Response(response_data, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        

class CustomTokenCreateView(TokenCreateView):
    serializer_class = CustomTokenCreateSerializer

    def post(self, request, *args, **kwargs):
        # Log the incoming request for debugging
        print("Login attempt with data:", request.data)

        # Check for required fields in the request
        email = request.data.get('email')
        password = request.data.get('password')

        if not email or not password:
            response_data = {
                "status": "fail",
                "message": "Email and password are required.",
                "data": {
                    "email": "This field is required." if not email else None,
                    "password": "This field is required." if not password else None,
                }
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

        serializer = self.get_serializer(data=request.data)

        try:
            # Attempt to retrieve user by email 
            user = CustomUser.objects.get(email=email)

            # Validate and create the token using the custom serializer
            serializer.is_valid(raise_exception=True)
            token = serializer.validated_data['auth_token']
            response_data = {
                "status": "success",
                "message": "Login successful.",
                "data": {
                    "token": token,
                    "email": email,
                    "first_name": user.first_name,
                    "last_name": user.last_name,
                }
            }
            return Response(response_data, status=status.HTTP_200_OK)

        except ValidationError as e:
            # Handle validation errors and construct a clear response
            print("Login failed. Errors:", e.detail)
            error_messages = e.detail
            response_data = {
                "status": "fail",
                "message": error_messages.get('message', "Unable to log in with provided credentials."),
                "data": {
                    "error": error_messages.get('email', ["Invalid credentials."])[0]  # Get specific email error
                }
            }
            return Response(response_data, status=status.HTTP_400_BAD_REQUEST)

        except Exception as e:
            print("An unexpected error occurred:", str(e))
            return Response({
                "status": "fail",
                "message": "An unexpected error occurred.",
                "data": {
                    "error": "Internal server error. Please try again later."
                }
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class PasswordResetRequestView(APIView):
    """
    View to handle password reset requests by sending an OTP to the user's email.
    """

    permission_classes = [AllowAny]

    def post(self, request):
        # Extract email from request
        email = request.data.get("email")
        
        # Validate email field
        if not email:
            return Response({"status": "error", "message": "Email is required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Attempt to retrieve user by email
            user = CustomUser.objects.get(email=email)
            
            # Generate a 6-digit OTP and store it in cache for 5 minutes
            otp = random.randint(100000, 999999)
            cache.set(f"password_reset_otp_{user.id}", otp, timeout=300)
            
            # Prepare and send email with OTP
            email_message = EmailMessage(
                subject='Password Reset Verification Code',
                body=f'Your OTP code is {otp}',
                from_email=settings.DEFAULT_FROM_EMAIL,
                to=[user.email],
            )
            email_message.extra_headers = {'X-PM-Message-Stream': 'outbound'}
            email_message.send(fail_silently=False)

            # Success response
            return Response({"status": "success", "message": "OTP sent to email"}, status=status.HTTP_200_OK)
        
        except CustomUser.DoesNotExist:
            # Error response if user is not found
            return Response({"status": "error", "message": "User with this email does not exist"}, status=status.HTTP_404_NOT_FOUND)


class PasswordResetConfirmView(APIView):
    """
    View to handle password reset confirmation by validating OTP and setting a new password.
    """

    permission_classes = [AllowAny]

    def post(self, request):
        # Extract fields from request
        email = request.data.get("email")
        otp = request.data.get("otp")
        new_password = request.data.get("new_password")

        # Validate required fields
        if not email or not otp or not new_password:
            missing_fields = [field for field in ["email", "otp", "new_password"] if not request.data.get(field)]
            return Response(
                {"status": "error", "message": f"Missing required fields: {', '.join(missing_fields)}"},
                status=status.HTTP_400_BAD_REQUEST
            )

        try:
            # Retrieve user by email
            user = CustomUser.objects.get(email=email)
            
            # Retrieve cached OTP
            cached_otp = cache.get(f"password_reset_otp_{user.id}")

            # Check if OTP is expired or invalid
            if cached_otp is None:
                return Response({"status": "error", "message": "OTP expired or invalid"}, status=status.HTTP_400_BAD_REQUEST)

            # Check if OTP is correct
            if str(cached_otp) != str(otp):
                return Response({"status": "error", "message": "OTP is incorrect"}, status=status.HTTP_400_BAD_REQUEST)

            # Set new password
            user.set_password(new_password)
            user.save()
            
            # Clear OTP from cache after successful reset
            cache.delete(f"password_reset_otp_{user.id}")

            # Success response
            return Response({"status": "success", "message": "Password reset successfully"}, status=status.HTTP_200_OK)
        
        except CustomUser.DoesNotExist:
            # Error response if user is not found
            return Response({"status": "error", "message": "User with this email does not exist"}, status=status.HTTP_404_NOT_FOUND)


class CustomUserViewSet(UserViewSet):
    def set_password(self, request, *args, **kwargs):
        print("set_password method called")  # Debugging line to confirm method is triggered
        print(f"Request data: {request.data}")  # Log the request data

        # Call the parent method to handle the actual password change
        response = super().set_password(request, *args, **kwargs)

        print(f"Response from parent set_password: {response.data}")  # Debugging line to check response from parent method
        
        if response.status_code == status.HTTP_204_NO_CONTENT:
            # If password is changed successfully, modify the success response
            return Response(
                {"status": "success", "message": "Password has been updated successfully"},
                status=status.HTTP_200_OK
            )

        # Now handle errors by checking response.data
        error_message = response.data  # Capture entire error message from response

        # Log the error message
        print(f"Error response: {error_message}")

        # Customize error message format
        return Response(
            {
                "status": "fail",
                "message": error_message
            },
            status=response.status_code
        )


class UserProfileViewSet(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer


class UpdateProfileView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def put(self, request, *args, **kwargs):
        user = request.user
        profile = user.userprofile  # Assuming a OneToOne relationship

        # Update user fields
        user_serializer = UpdateProfileSerializer(user, data=request.data, partial=True)
        profile_serializer = UserProfileSerializer(profile, data=request.data, partial=True)

        if user_serializer.is_valid() and profile_serializer.is_valid():
            user_serializer.save()
            profile_serializer.save()
            return Response({
                "status": "success",
                "message": "Profile updated successfully.",
                "data": {
                    "user": user_serializer.data,
                    "profile": profile_serializer.data
                }
            }, status=status.HTTP_200_OK)

        return Response({
            "status": "fail",
            "message": "Profile update failed.",
            "errors": {
                "user": user_serializer.errors,
                "profile": profile_serializer.errors
            }
        }, status=status.HTTP_400_BAD_REQUEST)
    

class ChangePasswordView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, *args, **kwargs):
        serializer = ChangePasswordSerializer(data=request.data, context={'request': request})

        if serializer.is_valid():
            serializer.save()
            return Response({
                "status": "success",
                "message": "Password updated successfully."
            }, status=status.HTTP_200_OK)

        return Response({
            "status": "fail",
            "message": "Password update failed.",
            "errors": serializer.errors
        }, status=status.HTTP_400_BAD_REQUEST)


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

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance = serializer.save(user=self.request.user)
        postgres_user = self.request.user
        mongo_user = get_or_create_mongo_user(postgres_user)

        return self.process_audio(instance, mongo_user)

    def sanitize_header_value(self, value, max_length=200):
        """
        Sanitize header values by removing newlines and truncating the length.
        """
        sanitized_value = value.replace("\n", " ").replace("\r", " ")
        return sanitized_value[:max_length]

    def process_audio(self, instance, mongo_user):
        print("Processing audio...")
        audio_file = self.request.FILES.get('audio_file')

        if not audio_file or audio_file.size == 0:
            print("Audio file missing or empty.")
            return Response({"status": "fail", "message": "Audio file is required and cannot be empty."}, status=400)

        allowed_formats = {
            'audio/opus': '.opus',
            'audio/wav': '.wav',
            'audio/mpeg': '.mp3',
            'audio/x-wav': '.wav',
            'audio/m4a': '.m4a',
            'audio/mp4': '.m4a',
            'audio/ogg': '.opus'
        }

        try:
            content_type = audio_file.content_type
            print(f"Detected content type: {content_type}")

            if content_type not in allowed_formats:
                print("Unsupported audio format.")
                return Response({"status": "fail", "message": "Unsupported audio format."}, status=400)

            suffix = allowed_formats[content_type]
            print("Saving temporary audio file for transcription...")
            with tempfile.NamedTemporaryFile(delete=False, suffix=suffix) as temp_audio_file:
                audio_file.seek(0)
                temp_audio_file.write(audio_file.read())
                temp_audio_file.flush()

            print(f"Temp audio file saved at {temp_audio_file.name}.")
            transcription = transcribe_audio(temp_audio_file.name)

            if not transcription or 'Error' in transcription:
                print(f"Transcription failed: {transcription}")
                return Response({"status": "fail", "message": f"Transcription failed: {transcription}"}, status=400)

            print(f"Transcription result: {transcription}")
            instance.transcription = transcription
            instance.save()

            print("Calling RAG model to generate AI response...")
            ai_result = rag_response(user_id=mongo_user['_id'], query=transcription, knowledge_base="some_knowledge_base")

            if not ai_result or 'response' not in ai_result:
                print("AI response retrieval failed.")
                return Response({"status": "fail", "message": "AI response generation failed."}, status=500)

            instance.ai_response = ai_result['response']
            instance.save()

            print("Starting speech synthesis...")
            audio_file_path = synthesize_speech(ai_result['response'])

            if audio_file_path is None:
                print("Speech synthesis failed.")
                return Response({"status": "fail", "message": "Speech synthesis failed."}, status=500)

            print("Returning audio response to frontend.")
            file_size = os.path.getsize(audio_file_path)
            audio_file = open(audio_file_path, 'rb')

            response = StreamingHttpResponse(audio_file, content_type="audio/wav")
            response['Content-Disposition'] = 'inline; filename="response.wav"'
            response['Content-Length'] = str(file_size)

            # Add sanitized headers
            response['X-Transcription'] = self.sanitize_header_value(instance.transcription)
            response['X-AI-Response'] = self.sanitize_header_value(instance.ai_response)

            return response

        except Exception as e:
            print(f"Error during audio processing: {e}")
            return Response({"status": "fail", "message": f"Audio processing failed: {e}"}, status=500)

        finally:
            if 'temp_audio_file' in locals() and os.path.exists(temp_audio_file.name):
                print(f"Deleting temporary audio file: {temp_audio_file.name}")
                os.remove(temp_audio_file.name)


# The version of the audio endpoint that send a video url instead of streaming it directly.

# class AudioViewSet(viewsets.ModelViewSet):
#     queryset = Audio.objects.all()
#     serializer_class = AudioSerializer
#     parser_classes = [MultiPartParser, FormParser]

#     def create(self, request, *args, **kwargs):
#         serializer = self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         instance = serializer.save(user=self.request.user)
#         postgres_user = self.request.user
#         mongo_user = get_or_create_mongo_user(postgres_user)

#         return self.process_audio(instance, mongo_user)

#     def process_audio(self, instance, mongo_user):
#         audio_file = self.request.FILES.get('audio_file')

#         if not audio_file or audio_file.size == 0:
#             return Response({"status": "fail", "message": "Audio file is required and cannot be empty."}, status=400)

#         allowed_formats = {
#             'audio/opus': '.opus',
#             'audio/wav': '.wav',
#             'audio/mpeg': '.mp3',
#             'audio/x-wav': '.wav',
#             'audio/m4a': '.m4a',
#             'audio/mp4': '.m4a',
#             'audio/ogg': '.opus'
#         }

#         try:
#             content_type = audio_file.content_type
#             if content_type not in allowed_formats:
#                 return Response({"status": "fail", "message": "Unsupported audio format."}, status=400)

#             suffix = allowed_formats[content_type]
#             with tempfile.NamedTemporaryFile(delete=False, suffix=suffix) as temp_audio_file:
#                 audio_file.seek(0)
#                 temp_audio_file.write(audio_file.read())
#                 temp_audio_file.flush()

#             transcription = transcribe_audio(temp_audio_file.name)
#             if not transcription or 'Error' in transcription:
#                 return Response({"status": "fail", "message": f"Transcription failed: {transcription}"}, status=400)

#             instance.transcription = transcription
#             instance.save()

#             ai_result = rag_response(user_id=mongo_user['_id'], query=transcription, knowledge_base="some_knowledge_base")
#             if not ai_result or 'response' not in ai_result:
#                 return Response({"status": "fail", "message": "AI response generation failed."}, status=500)

#             instance.ai_response = ai_result['response']
#             instance.save()

#             audio_file_path = synthesize_speech(ai_result['response'])
#             if not audio_file_path:
#                 return Response({"status": "fail", "message": "Speech synthesis failed."}, status=500)

#             # Store audio file temporarily or upload to a storage service (optional improvement)
#             audio_download_url = f"/media/{os.path.basename(audio_file_path)}"  # Replace with actual storage logic

#             # JSON response with metadata and download URL
#             return Response({
#                 "status": "success",
#                 "transcription": instance.transcription,
#                 "ai_response": instance.ai_response,
#                 "audio_url": audio_download_url
#             }, status=200)

#         except Exception as e:
#             return Response({"status": "fail", "message": f"Audio processing failed: {str(e)}"}, status=500)

#         finally:
#             if 'temp_audio_file' in locals() and os.path.exists(temp_audio_file.name):
#                 os.remove(temp_audio_file.name)


class ReminderView(APIView):
    """
    API View to handle POST requests for personalized reminder notifications with audio.
    """

    def post(self, request, *args, **kwargs):
        # Deserialize incoming data
        serializer = ReminderSerializer(data=request.data)

        # Validate the request data
        if not serializer.is_valid():
            return Response({
                "status": "error",
                "message": "Validation failed",
                "data": serializer.errors
            }, status=status.HTTP_400_BAD_REQUEST)

        try:
            validated_data = serializer.validated_data
            reminder = validated_data['reminder']

            # Retrieve the current user from the request
            postgres_user = self.request.user

            # Get or create MongoDB user for this postgres_user
            mongo_user = get_or_create_mongo_user(postgres_user)

            # Generate personalized reminder content (title, subtitle, message)
            ai_response = reminder_message_full(mongo_user["_id"], reminder)

            if not ai_response:
                return Response({
                    "status": "fail",
                    "message": "Could not generate reminder message."
                }, status=status.HTTP_400_BAD_REQUEST)

            title = ai_response.get('title', 'Reminder')
            subtitle = ai_response.get('subtitle', 'You have a reminder.')
            main_message = ai_response.get('response', '')

            if not main_message:
                return Response({
                    "status": "fail",
                    "message": "No message generated for the reminder."
                }, status=status.HTTP_400_BAD_REQUEST)

            # Synthesize speech based on AI-generated main message
            print("Starting speech synthesis...")
            audio_file_path = synthesize_speech(main_message)

            if audio_file_path is None:
                print("Speech synthesis failed, returning error.")
                return Response({
                    "status": "fail",
                    "message": "Speech synthesis failed."
                }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

            print("Returning audio response to frontend.")

            # Calculate file size for response headers
            file_size = os.path.getsize(audio_file_path)

            # Open the audio file for streaming
            audio_file = open(audio_file_path, 'rb')

            # Create StreamingHttpResponse to stream the audio file
            response = StreamingHttpResponse(
                audio_file,
                content_type="audio/wav"
            )
            response['Content-Disposition'] = 'inline; filename="reminder.wav"'
            response['Content-Length'] = str(file_size)

            # Add title and subtitle to custom headers
            response['X-Reminder-Title'] = title.replace("\n", " ")
            response['X-Reminder-Subtitle'] = subtitle.replace("\n", " ")

            return response

        except Exception as e:
            # Handle any unexpected errors gracefully
            return Response({
                "status": "error",
                "message": "An error occurred while processing the reminder",
                "data": str(e)
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        finally:
            # Ensure the temporary audio file is deleted after response is streamed
            if 'audio_file_path' in locals() and os.path.exists(audio_file_path):
                try:
                    os.remove(audio_file_path)
                    print(f"Audio file deleted: {audio_file_path}")
                except PermissionError as e:
                    print(f"Failed to delete audio file: {e}")


class HealthSyncScoreView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        try:
            user = request.user
            data = request.data
            timestamps = data.get('timestamps', {})
            reminders = data.get('reminders', {})

            if not timestamps or not reminders:
                return Response({
                    "status": "fail",
                    "message": "Timestamps and reminders are required",
                    "data": None
                }, status=status.HTTP_400_BAD_REQUEST)

            calculator = HealthSyncScoreCalculator(user)
            daily_score = calculator.calculate_daily_adherence_score(timestamps, reminders)
            health_sync_score = calculator.save_score(daily_score)

            return Response({
                "status": "success",
                "message": "Health sync score calculated and stored successfully",
                "data": {
                    "dailyScore": health_sync_score.daily_score,
                    "monthlySyncScore": health_sync_score.cumulative_monthly_score
                }
            }, status=status.HTTP_200_OK)

        except Exception as e:
            return Response({
                "status": "error",
                "message": "An error occurred while processing the request",
                "data": str(e)
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


# Endpoints for the Web Dashboard

class TotalUsersView(APIView):
    permission_classes = [IsAuthenticated]  # Ensures only authenticated users can access

    def get(self, request, *args, **kwargs):
        try:
            User = get_user_model()  # Dynamically get the user model
            total_users = User.objects.count()  # Fetch the total number of users
            
            data = {"total_users": total_users}
            serializer = TotalUsersSerializer(data)
            
            return Response({
                "status": "success",
                "message": "Total users retrieved successfully.",
                "data": serializer.data
            }, status=status.HTTP_200_OK)

        except Exception as e:
            # Handle unexpected errors gracefully
            return Response({
                "status": "error",
                "message": f"An unexpected error occurred: {str(e)}",
                "data": None
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)