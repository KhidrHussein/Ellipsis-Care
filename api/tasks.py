from django.utils import timezone
from .models import Medication

def medication_reminder_job():
    now = timezone.now()
    medications = Medication.objects.filter(is_active=True, reminder_time__lte=now.time(), end_date__gte=now.date())

    for medication in medications:
        if medication.last_reminded and medication.last_reminded.date() == now.date():
            continue

        # Add your reminder sending logic here
        print(f"Reminder: {medication.name} for {medication.user_profile.user.username}")

        medication.last_reminded = now
        medication.save()

    print("Medication reminders checked and sent if necessary.")
