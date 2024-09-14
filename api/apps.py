from django.apps import AppConfig
import threading

class ApiConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'api'

    def ready(self):
        # Import signals
        import api.signals

        # Start the APScheduler in a new thread to prevent blocking
        from .scheduler import start
        scheduler_thread = threading.Thread(target=start)
        scheduler_thread.start()
