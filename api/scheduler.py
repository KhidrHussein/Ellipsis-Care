# # scheduler.py
# from apscheduler.schedulers.background import BackgroundScheduler
# from django_apscheduler.jobstores import DjangoJobStore
# from .tasks import medication_reminder_job
# import os

# def start():
#     if os.environ.get('RUN_MAIN', None) != 'true':
#         scheduler = BackgroundScheduler()
#         scheduler.add_jobstore(DjangoJobStore(), 'default')
        
#         # Schedule the medication reminder job
#         scheduler.add_job(medication_reminder_job, 'cron', hour=8, minute=0)
        
#         scheduler.start()
