from apscheduler.schedulers.background import BackgroundScheduler
from django.core.management.base import BaseCommand
from django_apscheduler.jobstores import DjangoJobStore, register_events
from api.tasks import medication_reminder_job

class Command(BaseCommand):
    help = "Runs APScheduler with Django."

    def handle(self, *args, **options):
        scheduler = BackgroundScheduler()
        scheduler.add_jobstore(DjangoJobStore(), "default")

        # Pass the function directly, not as a string
        scheduler.add_job(
            medication_reminder_job,  # Direct function reference
            'interval',
            minutes=1,
            id='medication_reminder_job'
        )

        register_events(scheduler)
        scheduler.start()
        print("Scheduler started, sending medication reminders every minute.")

        try:
            while True:
                pass
        except (KeyboardInterrupt, SystemExit):
            scheduler.shutdown()
            print("Scheduler stopped.")
