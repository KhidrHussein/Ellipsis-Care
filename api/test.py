# from django.test import TestCase
# from django.contrib.auth import get_user_model
# from api.models import UserProfile, HealthCondition
# from api.services import UserProfileService

# class UserProfileServiceTest(TestCase):

#     def setUp(self):
#         # Set up your test data
#         self.user = get_user_model().objects.create_user(
#             email='testuser@example.com',
#             password='password123!'
#         )
#         self.profile = UserProfile.objects.create(
#             user=self.user,
#             date_of_birth='1990-01-01',
#             gender='M',
#             language_preference='en',
#             emergency_contact='123456789'
#         )
#         HealthCondition.objects.create(
#             user_profile=self.profile,
#             name='Hypertension',
#             description='High blood pressure',
#             date_diagnosed='2022-01-01'
#         )

#     def test_get_user_profile(self):
#         # Test the get_user_profile method
#         service = UserProfileService()
#         profile_data = service.get_user_profile(self.user)

#         self.assertEqual(profile_data['date_of_birth'], '1990-01-01')
#         self.assertEqual(profile_data['gender'], 'M')
#         self.assertEqual(profile_data['language_preference'], 'en')
#         self.assertEqual(profile_data['emergency_contact'], '123456789')

#     def test_get_health_conditions(self):
#         # Test the get_health_conditions method
#         service = UserProfileService()
#         health_conditions = service.get_health_conditions(self.user)

#         self.assertEqual(len(health_conditions), 1)
#         self.assertEqual(health_conditions[0]['name'], 'Hypertension')


from django.test import TestCase
from .models import UserProfile, CustomUser

class UserProfileServiceTest(TestCase):

    @classmethod
    def setUpTestData(cls):
        # Create test data once for all tests
        cls.user = CustomUser.objects.create_user(email='testuser', password='12345')
        cls.profile = UserProfile.objects.create(
            user=cls.user,
            date_of_birth='1990-01-01',
            gender='M',
            language_preference='en',
            emergency_contact='123456789'
        )

    def test_get_health_conditions(self):
        profile = UserProfile.objects.get(user=self.user)
        self.assertEqual(profile.bio, 'This is a test bio')

    def test_get_user_profile(self):
        profile = UserProfile.objects.get(user=self.user)
        self.assertEqual(profile.location, 'Test Location')
