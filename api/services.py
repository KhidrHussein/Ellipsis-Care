from datetime import date
from django.utils import timezone
from .models import (
    CustomUser, UserProfile, HealthCondition, Medication, Meal, MealPlan,
    Appointment, Audio
)
from django.db.models import Q

class UserService:

    @staticmethod
    def get_user_by_email(email):
        try:
            return CustomUser.objects.get(email=email)
        except CustomUser.DoesNotExist:
            return None

    @staticmethod
    def activate_user(user):
        user.is_active = True
        user.save()

    @staticmethod
    def deactivate_user(user):
        user.is_active = False
        user.save()

    @staticmethod
    def get_user_profile(user):
        return UserProfile.objects.get(user=user)

    @staticmethod
    def get_user_health_conditions(user):
        profile = UserProfile.objects.get(user=user)
        return HealthCondition.objects.filter(user_profile=profile)

    @staticmethod
    def get_user_medications(user):
        profile = UserProfile.objects.get(user=user)
        return Medication.objects.filter(user_profile=profile)

    @staticmethod
    def get_user_meal_plans(user, week_start_date):
        profile = UserProfile.objects.get(user=user)
        return MealPlan.objects.filter(
            meal__user=profile, week_start_date=week_start_date
        )

    @staticmethod
    def get_user_appointments(user):
        return Appointment.objects.filter(user=user)

    @staticmethod
    def get_user_audio_files(user):
        return Audio.objects.filter(user=user)


class UserProfileService:

    @staticmethod
    def get_user_profile(user):
        return UserProfile.objects.get(user=user)

    @staticmethod
    def update_profile(user, **kwargs):
        profile = UserProfile.objects.get(user=user)
        for key, value in kwargs.items():
            setattr(profile, key, value)
        profile.save()
        return profile


class HealthConditionService:

    @staticmethod
    def add_health_condition(user_profile, name, description, date_diagnosed):
        return HealthCondition.objects.create(
            user_profile=user_profile,
            name=name,
            description=description,
            date_diagnosed=date_diagnosed
        )

    @staticmethod
    def update_health_condition(condition_id, **kwargs):
        condition = HealthCondition.objects.get(id=condition_id)
        for key, value in kwargs.items():
            setattr(condition, key, value)
        condition.save()
        return condition

    @staticmethod
    def get_health_condition_by_name(user_profile, name):
        return HealthCondition.objects.filter(user_profile=user_profile, name=name)


class MedicationService:

    @staticmethod
    def add_medication(user_profile, name, dosage, frequency, start_date, end_date, reminder_time, refill_needed=False):
        return Medication.objects.create(
            user_profile=user_profile,
            name=name,
            dosage=dosage,
            frequency=frequency,
            start_date=start_date,
            end_date=end_date,
            reminder_time=reminder_time,
            refill_needed=refill_needed
        )

    @staticmethod
    def update_medication(medication_id, **kwargs):
        medication = Medication.objects.get(id=medication_id)
        for key, value in kwargs.items():
            setattr(medication, key, value)
        medication.save()
        return medication

    @staticmethod
    def get_active_medications(user_profile):
        return Medication.objects.filter(user_profile=user_profile, is_active=True)


class MealService:

    @staticmethod
    def add_meal(name, description, ingredients, nutritional_info):
        return Meal.objects.create(
            name=name,
            description=description,
            ingredients=ingredients,
            nutritional_info=nutritional_info
        )

    @staticmethod
    def get_meal_by_name(name):
        return Meal.objects.get(name=name)


class MealPlanService:

    @staticmethod
    def create_meal_plan(day_of_week, meal_type, meal, week_start_date):
        return MealPlan.objects.create(
            day_of_week=day_of_week,
            meal_type=meal_type,
            meal=meal,
            week_start_date=week_start_date
        )

    @staticmethod
    def get_meal_plan(user, week_start_date):
        profile = UserProfile.objects.get(user=user)
        return MealPlan.objects.filter(
            meal__user=profile, week_start_date=week_start_date
        )


class AppointmentService:

    @staticmethod
    def add_appointment(user, doctor_name, hospital_name, appointment_date, reason):
        return Appointment.objects.create(
            user=user,
            doctor_name=doctor_name,
            hospital_name=hospital_name,
            appointment_date=appointment_date,
            reason=reason
        )

    @staticmethod
    def update_appointment_status(appointment_id, status):
        appointment = Appointment.objects.get(id=appointment_id)
        appointment.status = status
        appointment.save()
        return appointment

    @staticmethod
    def get_upcoming_appointments(user):
        return Appointment.objects.filter(
            user=user,
            appointment_date__gte=timezone.now()
        )


class AudioService:

    @staticmethod
    def add_audio_file(user, audio_file, transcription=None):
        return Audio.objects.create(
            user=user,
            audio_file=audio_file,
            transcription=transcription
        )

    @staticmethod
    def get_audio_files(user):
        return Audio.objects.filter(user=user)


class AIIntegrationService:

    @staticmethod
    def get_user_data(user):
        user_profile = UserService.get_user_profile(user)
        health_conditions = HealthConditionService.get_health_condition_by_name(user_profile)
        medications = MedicationService.get_active_medications(user_profile)
        meal_plans = MealPlanService.get_meal_plan(user, date.today())
        appointments = AppointmentService.get_upcoming_appointments(user)
        audio_files = AudioService.get_audio_files(user)

        return {
            "user_profile": user_profile,
            "health_conditions": list(health_conditions),
            "medications": list(medications),
            "meal_plans": list(meal_plans),
            "appointments": list(appointments),
            "audio_files": list(audio_files),
        }
