import os
from django.core.wsgi import get_wsgi_application


# settings_module = 'EllipsisCare.deployment' if 'WEBSITE_HOSTNAME' in os.environ else 'EllipsisCare.settings'

# os.environ.setdefault('DJANGO_SETTINGS_MODULE', settings_module)

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'EllipsisCare.settings')

application = get_wsgi_application()

