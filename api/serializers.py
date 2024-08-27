from django.contrib.auth import get_user_model
from rest_framework import serializers
from .models import UserProfile, Medication, HealthCondition, MealPlan, Meal, Appointment, User, Audio

# User = get_user_model()

# class UserSerializer(serializers.ModelSerializer):
#     password = serializers.CharField(write_only=True)

#     class Meta:
#         model = User
#         fields = ['email', 'password', 'username']
#         extra_kwargs = {'username': {'required': False, 'allow_blank': True}}

#     def create(self, validated_data):
#         user = User.objects.create_user(
#             username=validated_data.get('username', ''),  # Default to an empty string if username is optional
#             email=validated_data['email'],
#             password=validated_data['password']
#         )
#         return user

from .models import CustomUser

class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = CustomUser
        fields = ['email', 'password', 'username']
        extra_kwargs = {'username': {'required': False, 'allow_blank': True}}

    def create(self, validated_data):
        user = CustomUser.objects.create_user(
            email=validated_data['email'],
            password=validated_data['password'],
            username=validated_data.get('username', '')  # Optional username
        )
        return user



class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = '__all__'

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
        fields = ['id', 'user', 'audio_file', 'transcription', 'created_at']
        read_only_fields = ['id', 'transcription', 'created_at']