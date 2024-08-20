from celery import shared_task
from .models import Medication
from django.utils import timezone
import logging

@shared_task
def test_task():
    print("Task successfully executed!")

# logger = logging.getLogger(__name__)

# @shared_task
# def send_medication_reminders():
#     logger.info("Medication reminder task triggered")
#     now = timezone.now()
#     medications = Medication.objects.filter(is_active=True, reminder_time__lte=now.time(), end_date__gte=now.date())

#     for medication in medications:
#         if medication.last_reminded and medication.last_reminded.date() == now.date():
#             continue

#         # Send the reminder
#         send_reminder(medication)

#         medication.last_reminded = now
#         medication.save()

# def send_reminder(medication):
#     user = medication.user_profile.user
#     message = f"Reminder to take your medication: {medication.dosage} of {medication.name} Now!!!"
#     logger.info(f"Sending reminder to {user.username}: {message}")
