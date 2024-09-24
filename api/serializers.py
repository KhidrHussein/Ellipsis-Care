from django.contrib.auth import get_user_model
from rest_framework import serializers
from .models import UserProfile, Medication, HealthCondition, MealPlan, Meal, Appointment, Audio, CustomUser


# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = CustomUser
#         fields = ['email', 'username', 'password']  # Include the fields you need
#         extra_kwargs = {'password': {'write_only': True}}

#     def create(self, validated_data):
#         user = CustomUser.objects.create_user(**validated_data)
#         user.is_active = False  # Deactivate the user until they verify their email
#         user.save()
#         return user


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['id', 'email', 'first_name', 'last_name', 'password']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        # Automatically set the username as the first name
        validated_data['username'] = validated_data.get('first_name')
        user = CustomUser(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
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
        fields = ['id', 'transcription', 'ai_response', 'created_at']  # Include 'ai_response'
        read_only_fields = ['transcription', 'ai_response', 'created_at']  # These will be auto-set

    def create(self, validated_data):
        return Audio.objects.create(**validated_data)
