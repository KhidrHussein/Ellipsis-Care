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

# Add the virtual environment packages directory (specific to your deployment)
venv_site_packages = '/tmp/antenv/lib/python3.11/site-packages'
if os.path.exists(venv_site_packages):  # Check if the virtual environment directory exists
    sys.path.append(venv_site_packages)

sys.path.append('venv/Lib/site-packages')


application = get_wsgi_application()

