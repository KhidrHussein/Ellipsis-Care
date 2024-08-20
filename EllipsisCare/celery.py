# EllipsisCare/celery.py
from __future__ import absolute_import, unicode_literals
import os
from celery import Celery

# Set the default Django settings module
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'EllipsisCare.settings')

app = Celery('EllipsisCare',
            broker='redis://localhost:6379/0',
            backend='redis://localhost:6379/0',
            include=['api.tasks'])

# Using a string here means the worker doesn’t have to serialize
# the configuration object to child processes.
app.config_from_object('django.conf:settings', namespace='CELERY')

# Load task modules from all registered Django app configs.
app.autodiscover_tasks()
