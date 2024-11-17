from rag_implementation.config.database import collection
from datetime import datetime
from .models import HealthSyncScore
from django.utils import timezone

def get_or_create_mongo_user(postgres_user):
    new_user = {
        'name': postgres_user.username,
        'email_address': postgres_user.email,
        'full_history': [],
        'buffer_history': []
    }

    mongo_user = collection.find_one({"email_address": new_user["email_address"]})
    if not mongo_user:
        result = collection.insert_one(new_user)
        mongo_user = collection.find_one({"_id": result.inserted_id})

    return mongo_user


class HealthSyncScoreCalculator:
    def __init__(self, user):
        self.user = user
        self.weights = {
            'meals': 0.4,
            'medication': 0.4,
            'appointments': 0.2
        }

    def calculate_daily_adherence_score(self, timestamps, reminders):
        adherence_score = 0
        total_weight = sum(self.weights.values())

        for key, weight in self.weights.items():
            if key in timestamps and key in reminders:
                reminder_times = reminders[key]
                completion_times = timestamps[key]

                if not reminder_times:
                    continue  # Skip if no reminders for this category

                timely_adherence = 0
                for reminder, completion in zip(reminder_times, completion_times):
                    reminder_time = datetime.strptime(reminder, '%Y-%m-%d %H:%M:%S')
                    completion_time = datetime.strptime(completion, '%Y-%m-%d %H:%M:%S')

                    time_diff = (completion_time - reminder_time).total_seconds() / 60  # in minutes

                    if time_diff <= 15:
                        timely_adherence += 1  # Full adherence
                    elif time_diff <= 60:
                        timely_adherence += 0.75  # Partial adherence
                    else:
                        timely_adherence += 0.5  # Minimal adherence

                category_score = (timely_adherence / len(reminder_times)) * weight
                adherence_score += category_score

        return round((adherence_score / total_weight) * 100)  # Normalize to a percentage and round

    def calculate_monthly_sync_score(self):
        current_month = timezone.now().month
        current_year = timezone.now().year

        past_scores = HealthSyncScore.objects.filter(
            user=self.user,
            date__month=current_month,
            date__year=current_year
        ).values_list('daily_score', flat=True)

        return round(sum(past_scores) / len(past_scores)) if past_scores else 0  # Round monthly score

    def save_score(self, daily_score):
        current_date = timezone.now().date()  # Get today's date from system time
        monthly_score = self.calculate_monthly_sync_score() + daily_score

        # Create a new record for the user for the current date
        health_sync_score = HealthSyncScore.objects.create(
            user=self.user,
            date=current_date,  # Use current system date for today
            daily_score=round(daily_score),  # Round the daily score
            cumulative_monthly_score=round(monthly_score)  # Round the monthly score
        )

        return health_sync_score
