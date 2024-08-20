from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserProfileViewSet, MedicationViewSet, HealthConditionViewSet, MealPlanViewSet, AppointmentViewSet, AudioViewSet

router = DefaultRouter()
router.register(r'userprofiles', UserProfileViewSet)
router.register(r'medications', MedicationViewSet)
router.register(r'conditions', HealthConditionViewSet)
router.register(r'mealplans', MealPlanViewSet)
router.register(r'appointments', AppointmentViewSet)
router.register(r'audio', AudioViewSet)

urlpatterns = [
    path('', include(router.urls)),  # Include all router-generated URLs
    path('auth/', include('djoser.urls')),  # Djoser auth routes
    path('auth/token/', include('djoser.urls.authtoken')),  # Token-based auth
    path('accounts/', include('allauth.urls')),  # Allauth routes
]
