"""
WSGI config for EllipsisCare project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/
"""

import os
import sys

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'EllipsisCare.settings')

sys.path.append('C:/Users/Hp/EllipsisCare/EllipsisCare')
sys.path.append('C:/Users/Hp/EllipsisCare/venv/Lib/site-packages') 
sys.path.append('/tmp/8dd18639cae188a/requirements.txt')

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Ellipsiscare.settings')

application = get_wsgi_application()

