from django.contrib import admin
from django.contrib.auth.models import User
from .models import UserProfile, HealthCondition, Medication, Meal, MealPlan, Appointment, Audio, CustomUser
from django.contrib.auth.admin import UserAdmin as DefaultUserAdmin
from django import forms

from django_apscheduler.models import DjangoJob, DjangoJobExecution

# Define a custom form for user creation and change
class UserCreationForm(forms.ModelForm):
    password1 = forms.CharField(widget=forms.PasswordInput())
    password2 = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'first_name', 'last_name')

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords do not match")
        return password2

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user


class UserChangeForm(forms.ModelForm):
    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'first_name', 'last_name', 'is_active', 'is_staff', 'is_superuser')


@admin.register(CustomUser)
class CustomUserAdmin(admin.ModelAdmin):
    form = UserChangeForm
    add_form = UserCreationForm

    list_display = ('email', 'username', 'first_name', 'last_name', 'is_staff', 'is_active')
    search_fields = ('email', 'username',  'first_name', 'last_name')
    list_filter = ('is_staff', 'is_active')


@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'age', 'gender', 'language_preference', 'emergency_contact')
    search_fields = ('user__username', 'gender', 'language_preference')
    list_filter = ('gender', 'language_preference')

@admin.register(HealthCondition)
class HealthConditionAdmin(admin.ModelAdmin):
    list_display = ('user_profile', 'name', 'date_diagnosed')
    search_fields = ('user_profile__user__username', 'name')
    list_filter = ('date_diagnosed',)

@admin.register(Medication)
class MedicationAdmin(admin.ModelAdmin):
    list_display = ('user_profile', 'name', 'dosage', 'frequency', 'start_date', 'end_date', 'reminder_time', 'refill_needed')
    search_fields = ('user_profile__user__username', 'name')
    list_filter = ('start_date', 'end_date', 'refill_needed')

@admin.register(Meal)
class MealAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    search_fields = ('name', 'ingredients')

@admin.register(MealPlan)
class MealPlanAdmin(admin.ModelAdmin):
    list_display = ('day_of_week', 'meal_type', 'meal', 'week_start_date')
    search_fields = ('meal__name',)
    list_filter = ('day_of_week', 'meal_type', 'week_start_date')

@admin.register(Appointment)
class AppointmentAdmin(admin.ModelAdmin):
    list_display = ('user', 'doctor_name', 'hospital_name', 'appointment_date', 'status')
    search_fields = ('user__username', 'doctor_name', 'hospital_name')
    list_filter = ('appointment_date', 'status')


@admin.register(Audio)
class AudioAdmin(admin.ModelAdmin):
    list_display = ('user', 'created_at', 'transcription', 'ai_response')
    search_fields = ('user__username', 'transcription')
    list_filter = ('created_at',)

    def has_add_permission(self, request, obj=None):
        """Disable adding new audio files from the admin panel"""
        return False

    def has_change_permission(self, request, obj=None):
        """Disable changing audio files from the admin panel"""
        return False

    def has_delete_permission(self, request, obj=None):
        """Enable deletion of audio files from the admin panel"""
        return True
    

# admin.site.register(DjangoJob)
# admin.site.register(DjangoJobExecution)