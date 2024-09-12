from django.apps import AppConfig
from .scheduler import start

class ApiConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'api'

    def ready(self):
        # Import signals
        import api.signals
        
        # Start the APScheduler when the Django app is ready
        start()
