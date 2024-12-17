from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (UserProfileViewSet, MedicationViewSet, HealthConditionViewSet, MealPlanViewSet, 
                    AppointmentViewSet, AudioViewSet, UserCreateViewSet, VerifyEmailView, ReminderView, 
                    CustomTokenCreateView, PasswordResetRequestView, PasswordResetConfirmView, CustomUserViewSet, 
                    HealthSyncScoreView, UpdateProfileView, ChangePasswordView, TotalUsersView, PatientAdherenceRateView,
                    CriticalAlertsView)

router = DefaultRouter()
router.register(r'userprofiles', UserProfileViewSet)
router.register(r'medications', MedicationViewSet)
router.register(r'conditions', HealthConditionViewSet)
router.register(r'mealplans', MealPlanViewSet)
router.register(r'appointments', AppointmentViewSet)
router.register(r'audio', AudioViewSet)
router.register(r'users', UserCreateViewSet, basename='user')

urlpatterns = [
    path('', include(router.urls)),  # Include all router-generated URLs
    path('auth/', include('djoser.urls.authtoken')),  # Token-based auth
    path('auth/login/', CustomTokenCreateView.as_view(), name='login'),
    path('auth/password-reset/', PasswordResetRequestView.as_view(), name='password-reset-request'),
    path('auth/password-reset-confirm/', PasswordResetConfirmView.as_view(), name='password-reset-confirm'),
    path('auth/users/set_password/', CustomUserViewSet.as_view({'post': 'set_password'}), name='customuser-set-password'),
    path('profile/update/', UpdateProfileView.as_view(), name='profile-update'),
    path('password/change/', ChangePasswordView.as_view(), name='password-change'),
    path('accounts/', include('allauth.urls')),  # Allauth routes
    path('auth/verify-email/', VerifyEmailView.as_view(), name='verify-email'), 
    path('reminder/', ReminderView.as_view(), name='reminder'),
    path('health-sync-score/', HealthSyncScoreView.as_view(), name='health-sync-score'),

    # Web Dashboard
    path('dashboard/total-users/', TotalUsersView.as_view(), name='total-users'),
    path('patient-adherence-rate/', PatientAdherenceRateView.as_view(), name='patient_adherence_rate'),
    path('critical-alerts/', CriticalAlertsView.as_view(), name='critical_alerts'),
]
