from django.contrib.auth import get_user_model, authenticate
from rest_framework import serializers
from .models import (UserProfile, Medication, HealthCondition, MealPlan, Meal, Appointment, Audio, CustomUser, 
                     UserHealthMetrics, Reminder, FoodReminder, DrugReminder, AppointmentReminder)

from djoser.serializers import TokenCreateSerializer
from rest_framework.authtoken.models import Token
from rest_framework.exceptions import ValidationError


class CustomTokenCreateSerializer(TokenCreateSerializer):
    def validate(self, attrs):
        email = attrs.get('email')
        password = attrs.get('password')
        print(f"Attempting to authenticate user with email: {email}")

        # Authenticate using the email as the username
        user = authenticate(username=email, password=password)

        # Check if the authentication failed
        if user is None:
            print("Authentication failed.")
            raise ValidationError({
                "message": "Invalid credentials.",
                "email": ["No user found with this email address or password is incorrect."]
            })

        # Check if the user is inactive
        if not user.is_active:
            raise ValidationError({
                "message": "Account inactive.",
                "email": ["Your account has not been verified. Please check your email for the verification link."]
            })

        print("Authentication succeeded. User ID:", user.id)

        # Create or get the existing auth token for the user
        token, created = Token.objects.get_or_create(user=user)

        # Ensure the token has a user associated
        if not user or token.user is None:
            print("Token creation failed. User is not associated with the token.")
            raise ValidationError({
                "message": "Token generation failed.",
                "detail": ["Token could not be created. Please try again."]
            })

        print("Token generated:", token.key)
        return {'auth_token': token.key}


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['id', 'email', 'first_name', 'last_name', 'password']
        # fields = '__all__'
        extra_kwargs = {
            'password': {'write_only': True, 'required': True},  # Password is required
            'email': {'required': True},  # Email is required
            'first_name': {'required': False},  # First name is optional
            'last_name': {'required': False},  # Last name is optional
        }

    def create(self, validated_data):
        # Automatically set the username as the first name
        validated_data['username'] = validated_data.get('first_name')
        user = CustomUser(**validated_data)
        user.set_password(validated_data['password'])  # Hash the password
        user.save()
        return user


class UpdateProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['first_name', 'last_name', 'email']


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ['date_of_birth', 'gender', 'language_preference', 'profile_picture']


class ChangePasswordSerializer(serializers.Serializer):
    old_password = serializers.CharField(write_only=True)
    new_password = serializers.CharField(write_only=True)
    confirm_new_password = serializers.CharField(write_only=True)

    def validate_old_password(self, value):
        user = self.context['request'].user
        if not user.check_password(value):
            raise serializers.ValidationError("Old password is incorrect.")
        return value

    def validate(self, attrs):
        new_password = attrs.get('new_password')
        confirm_new_password = attrs.get('confirm_new_password')

        # Check if the new password matches the confirmation
        if new_password != confirm_new_password:
            raise serializers.ValidationError({
                "confirm_new_password": "New passwords do not match."
            })

        # Perform additional validation on the new password if needed
        if len(new_password) < 8:
            raise serializers.ValidationError({
                "new_password": "New password must be at least 8 characters long."
            })

        return attrs

    def save(self, **kwargs):
        user = self.context['request'].user
        user.set_password(self.validated_data['new_password'])
        user.save()


class MedicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Medication
        fields = '__all__'


class HealthConditionSerializer(serializers.ModelSerializer):
    class Meta:
        model = HealthCondition
        fields = '__all__'


class MealSerializer(serializers.ModelSerializer):
    class Meta:
        model = Meal
        fields = '__all__'


class MealPlanSerializer(serializers.ModelSerializer):
    meal = MealSerializer()  # Nested serializer to include meal details

    class Meta:
        model = MealPlan
        fields = '__all__'


class AppointmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Appointment
        fields = '__all__'


class AudioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Audio
        fields = ['id', 'transcription', 'ai_response', 'created_at']  # Include 'ai_response'
        read_only_fields = ['transcription', 'ai_response', 'created_at']  # These will be auto-set

    def create(self, validated_data):
        return Audio.objects.create(**validated_data)


# class ReminderSerializer(serializers.Serializer):
#     # user_id = serializers.CharField(required=True)
#     reminder = serializers.DictField(required=True)

#     def validate_reminder(self, value):
#         required_fields = ['name', 'type', 'schedule', 'interval', 'dosage', 'duration', 'instruction', 'time']
        
#         # Check if all required fields are present
#         for field in required_fields:
#             if field not in value:
#                 raise serializers.ValidationError(f"'{field}' field is missing in the reminder details.")
        
#         # Validate the 'duration' field
#         if 'duration' in value:
#             if 'start' not in value['duration'] or 'end' not in value['duration']:
#                 raise serializers.ValidationError("Both 'start' and 'end' dates must be provided in 'duration'.")
        
#         return value


# Base Reminder Serializer

class ReminderSerializer(serializers.ModelSerializer):
    details = serializers.JSONField(required=False)  # Flexible field to accommodate varying reminder types
    time = serializers.TimeField(required=True)  
    start_date = serializers.DateField(required=True)
    end_date = serializers.DateField(required=True)

    class Meta:
        model = Reminder
        fields = ['id', 'type', 'description', 'time', 'start_date', 'end_date', 'details']

    def create(self, validated_data):
        """
        Handle the creation of a Reminder along with its associated details.
        """
        details = validated_data.pop('details', None)  # Extract details from validated data
        reminder = Reminder.objects.create(**validated_data)  # Create the base Reminder object

        # Handle specific reminder types
        reminder_type = validated_data['type']
        if reminder_type == Reminder.ReminderType.FOOD and details:
            FoodReminder.objects.filter(reminder=reminder).delete()  # Ensure no duplicate
            FoodReminder.objects.create(reminder=reminder, **details)
        elif reminder_type == Reminder.ReminderType.DRUG and details:
            DrugReminder.objects.filter(reminder=reminder).delete()  # Ensure no duplicate
            DrugReminder.objects.create(reminder=reminder, **details)
        elif reminder_type == Reminder.ReminderType.APPOINTMENT and details:
            AppointmentReminder.objects.filter(reminder=reminder).delete()  # Ensure no duplicate
            AppointmentReminder.objects.create(reminder=reminder, **details)

        return reminder


class DrugReminderSerializer(serializers.ModelSerializer):
    medication_name = serializers.CharField(required=False)
    dosage = serializers.CharField(required=False)
    frequency = serializers.CharField(required=False)

    class Meta:
        model = DrugReminder
        fields = ['medication_name', 'dosage', 'frequency']


class FoodReminderSerializer(serializers.ModelSerializer):
    meal_type = serializers.CharField(required=False)
    calories = serializers.IntegerField(required=False)

    class Meta:
        model = FoodReminder
        fields = ['meal_type', 'calories']


class AppointmentReminderSerializer(serializers.ModelSerializer):
    location = serializers.CharField(required=False)
    doctor_name = serializers.CharField(required=False)
    notes = serializers.CharField(required=False)

    class Meta:
        model = AppointmentReminder
        fields = ['location', 'doctor_name', 'notes']



# Serializers for the Web Dashboard

class TotalUsersSerializer(serializers.Serializer):
    total_users = serializers.IntegerField()


class AdherenceRateSerializer(serializers.Serializer):
    average_adherence_rate = serializers.FloatField()
    worst_sync_percentage = serializers.FloatField()
    optimal_sync_percentage = serializers.FloatField()


class CriticalAlertSerializer(serializers.Serializer):
    name = serializers.CharField()
    sync_score = serializers.FloatField()
    user_id = serializers.IntegerField()


class ConcerningMetricSerializer(serializers.Serializer):
    metric = serializers.CharField()
    value = serializers.FloatField()
    threshold = serializers.FloatField()


class UserConcerningMetricsSerializer(serializers.ModelSerializer):
    # Remove concerning_metrics from here; it will be added dynamically in the view
    class Meta:
        model = UserHealthMetrics
        fields = ['user', 'bmi', 'systolic_blood_pressure', 'diastolic_blood_pressure', 'sugar_level', 'weight', 'height']

    def to_representation(self, instance):
        """
        Customize the output to include user details and dynamic data.
        """
        representation = super().to_representation(instance)
        representation['user_id'] = instance.user.id
        representation['name'] = f"{instance.user.last_name} {instance.user.first_name}"
        return representation
