from django.db import models
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.utils import timezone
from datetime import date
from EllipsisCare import settings

from datetime import date
from django.core.exceptions import ValidationError
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

from django.contrib.auth.models import BaseUserManager
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db import models
from .managers import CustomUserManager

from django.utils.translation import gettext_lazy as _
from django.core.validators import FileExtensionValidator




class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=30, null=True, blank=True)
    first_name = models.CharField(max_length=30, blank=True, null=True)  # Optional
    last_name = models.CharField(max_length=30, blank=True, null=True)   # Optional
    is_active = models.BooleanField(default=False)  # Set default to False
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(auto_now_add=True)
    is_verified = models.BooleanField(default=False)  # To track if the user has verified their email
    verification_code = models.CharField(max_length=6, blank=True, null=True)  # To store the 6-digit code

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []  # No required fields by default

    def __str__(self):
        return self.email


# class UserProfile(models.Model):
#     GENDER_CHOICES = [
#         ('M', 'Male'),
#         ('F', 'Female'),
#         ('P', 'Prefer not to say'),
#     ]
#     user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
#     date_of_birth = models.DateField(null=True, blank=True)

#     # Ensure the date is valid
#     def clean(self):
#         if self.date_of_birth and self.date_of_birth > timezone.now().date():
#             raise ValidationError("Date of birth cannot be in the future.")
        
#     # Calculate the age from the DOB
#     @property
#     def age(self):
#         if self.date_of_birth:  # Check if date_of_birth is not None
#             today = date.today()
#             return today.year - self.date_of_birth.year - ((today.month, today.day) < (self.date_of_birth.month, self.date_of_birth.day))
#         return None  # Return None or an appropriate default if date_of_birth is not set
    
#     gender = models.CharField(
#         max_length=1,
#         choices=GENDER_CHOICES,
#         default='P'
#     )
#     language_preference = models.CharField(max_length=20, 
#                                            choices=[('en', 'English'), ('yo', 'Yoruba'), ('ha', 'Hausa'), ('ig', 'Igbo')], default='en')

#     def __str__(self):
#         return f"{self.user.username}"


from django.core.validators import FileExtensionValidator

class UserProfile(models.Model):
    GENDER_CHOICES = [
        ('M', 'Male'),
        ('F', 'Female'),
        ('P', 'Prefer not to say'),
    ]
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    date_of_birth = models.DateField(null=True, blank=True)

    # Ensure the date is valid
    def clean(self):
        if self.date_of_birth and self.date_of_birth > timezone.now().date():
            raise ValidationError("Date of birth cannot be in the future.")
        
    # Calculate the age from the DOB
    @property
    def age(self):
        if self.date_of_birth:  # Check if date_of_birth is not None
            today = date.today()
            return today.year - self.date_of_birth.year - ((today.month, today.day) < (self.date_of_birth.month, self.date_of_birth.day))
        return None  # Return None or an appropriate default if date_of_birth is not set

    gender = models.CharField(
        max_length=1,
        choices=GENDER_CHOICES,
        default='P'
    )
    language_preference = models.CharField(
        max_length=20, 
        choices=[
            ('en', 'English'), 
            ('yo', 'Yoruba'), 
            ('ha', 'Hausa'), 
            ('ig', 'Igbo')
        ], 
        default='en'
    )

    profile_picture = models.ImageField(
        upload_to='profile_pictures/', 
        null=True, 
        blank=True,
        validators=[
            FileExtensionValidator(allowed_extensions=['jpg', 'jpeg', 'png'])
        ],
        help_text=_("Upload a JPG, JPEG, or PNG image.")
    )

    def __str__(self):
        return f"{self.user.username or self.user.email}"


class HealthCondition(models.Model):
    user_profile = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name='health_conditions')
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    date_diagnosed = models.DateField()

    def __str__(self):
        return self.name


class Medication(models.Model):
    user_profile = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name='medications')
    name = models.CharField(max_length=100)
    dosage = models.IntegerField()
    frequency = models.IntegerField()
    start_date = models.DateField()
    end_date = models.DateField(null=True, blank=True)
    reminder_time = models.TimeField()
    refill_date = models.DateField(null=True, blank=True)
    refill_needed = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)  # For toggling reminder on/off
    last_reminded = models.DateTimeField(null=True, blank=True)  # Last reminder sent

    def __str__(self):
        return f"{self.name} - {self.dosage}"


class Meal(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    ingredients = models.TextField()
    nutritional_info = models.JSONField()  # You can store nutritional information as a JSON object

    def __str__(self):
        return self.name


class MealPlan(models.Model):
    WEEKDAYS = [
        ('Monday', 'Monday'),
        ('Tuesday', 'Tuesday'),
        ('Wednesday', 'Wednesday'),
        ('Thursday', 'Thursday'),
        ('Friday', 'Friday'),
        ('Saturday', 'Saturday'),
        ('Sunday', 'Sunday'),
    ]
    
    BREAKFAST = 'Breakfast'
    LUNCH = 'Lunch'
    DINNER = 'Dinner'
    
    MEAL_CHOICES = [
        (BREAKFAST, 'Breakfast'),
        (LUNCH, 'Lunch'),
        (DINNER, 'Dinner'),
    ]
    
    # Represents the day of the week
    day_of_week = models.CharField(max_length=9, choices=WEEKDAYS)

    # Represents the type of meal
    meal_type = models.CharField(max_length=10, choices=MEAL_CHOICES)

    # ForeignKey to Meal model
    meal = models.ForeignKey(Meal, on_delete=models.CASCADE)

    # Define the week
    week_start_date = models.DateField()

    def __str__(self):
        return f"{self.get_meal_type_display()} for {self.get_day_of_week_display()}"

    class Meta:
        unique_together = ('day_of_week', 'meal_type', 'week_start_date')


class Appointment(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    doctor_name = models.CharField(max_length=255)
    hospital_name = models.CharField(max_length=255)
    appointment_date = models.DateTimeField()
    reason = models.TextField()
    status = models.CharField(
        max_length=50,
        choices=[('Scheduled', 'Scheduled'), ('Completed', 'Completed'), ('Cancelled', 'Cancelled')],
        default='Scheduled'
    )

    def __str__(self):
        return f"Appointment with Dr. {self.doctor_name} on {self.appointment_date}"


class Audio(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    audio_file = models.FileField(upload_to='audio_files/', null=True, blank=True)
    transcription = models.TextField(blank=True, null=True)
    ai_response = models.TextField(blank=True, null=True)  # Field to store AI-generated response
    synthesized_audio = models.FileField(upload_to='synthesized_audio/', blank=True, null=True)  # Field to store path to synthesized audio file
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Audio {self.id} by {self.user.username}"


class HealthSyncScore(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    # date = models.DateField(auto_now_add=True)
    date = models.DateField()  # Remove auto_now_add=True, so you can manually set the date
    daily_score = models.FloatField()
    cumulative_monthly_score = models.FloatField()

    class Meta:
        unique_together = ('user', 'date')  # Enforce uniqueness on the combination of user and date

    def __str__(self):
        return f"Health Sync Score for {self.user} on {self.date}"


class HealthMetricThreshold(models.Model):
    name = models.CharField(max_length=255)  # e.g., 'systolic_blood_pressure'
    threshold_value = models.FloatField()  # The threshold value (e.g., 140 for systolic BP)
    is_active = models.BooleanField(default=True)  # Whether this threshold is active

    def __str__(self):
        return f"{self.name} - {self.threshold_value}"


class UserHealthMetrics(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    systolic_blood_pressure = models.IntegerField(null=True, blank=True)
    diastolic_blood_pressure = models.IntegerField(null=True, blank=True)
    sugar_level = models.FloatField(null=True, blank=True)
    weight = models.FloatField(null=True, blank=True)
    height = models.FloatField(null=True, blank=True)
    bmi = models.FloatField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Health Metrics for {self.user}"

    def calculate_bmi(self):
        """Calculate BMI based on weight and height"""
        if self.weight and self.height:
            self.bmi = self.weight / (self.height ** 2)
        return self.bmi

    def get_threshold(self, metric_name):
        """Fetch threshold from DB or return default value."""
        try:
            threshold = HealthMetricThreshold.objects.get(name=metric_name, is_active=True)
            return threshold.threshold_value
        except HealthMetricThreshold.DoesNotExist:
            default_thresholds = {
                'systolic_blood_pressure': 140,
                'diastolic_blood_pressure': 90,
                'sugar_level': 120,
                'bmi': 30,
            }
            return default_thresholds.get(metric_name, 0)

    def is_concerning(self):
        """Check if metrics exceed thresholds."""
        concerning = False
        if (self.systolic_blood_pressure and 
            self.systolic_blood_pressure > self.get_threshold('systolic_blood_pressure')):
            concerning = True
        elif (self.diastolic_blood_pressure and 
              self.diastolic_blood_pressure > self.get_threshold('diastolic_blood_pressure')):
            concerning = True
        if self.sugar_level and self.sugar_level > self.get_threshold('sugar_level'):
            concerning = True
        if self.bmi and self.bmi > self.get_threshold('bmi'):
            concerning = True
        return concerning


class Reminder(models.Model):
    class ReminderType(models.TextChoices):
        FOOD = 'food', _('Food')
        DRUG = 'drug', _('Drug')
        APPOINTMENT = 'appointment', _('Appointment')

    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="reminders")
    type = models.CharField(max_length=20, choices=ReminderType.choices)
    name = models.CharField(max_length=255)
    description = models.TextField(null=True, blank=True)
    time = models.TimeField()
    start_date = models.DateField(blank=False)
    end_date = models.DateField(blank=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.type.capitalize()} Reminder for {self.user.username}"


class FoodReminder(models.Model):
    reminder = models.OneToOneField(Reminder, on_delete=models.CASCADE, related_name="food_details")
    meal_type = models.CharField(max_length=50, choices=[("breakfast", "Breakfast"), ("lunch", "Lunch"), ("dinner", "Dinner")])
    calories = models.PositiveIntegerField(null=True, blank=True)


class DrugReminder(models.Model):
    reminder = models.OneToOneField(Reminder, on_delete=models.CASCADE, related_name="drug_details")
    medication_name = models.CharField(max_length=255)
    dosage = models.CharField(max_length=100)
    frequency = models.CharField(max_length=100)


class AppointmentReminder(models.Model):
    reminder = models.OneToOneField(Reminder, on_delete=models.CASCADE, related_name="appointment_details")
    location = models.CharField(max_length=255)
    doctor_name = models.CharField(max_length=255)
    notes = models.TextField(null=True, blank=True)
