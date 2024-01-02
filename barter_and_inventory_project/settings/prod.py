import os
from pathlib import Path

import dj_database_url

from barter_and_inventory_project.settings.utils import get_secret

BASE_DIR = Path(__file__).resolve().parent.parent.parent

SECRET_KEY = 'django-insecure-0a+#j8*bh23au299(gy=#o45g&&rqjux*r^)8h--rq^d5zwoz1'

DEBUG = True

ALLOWED_HOSTS = ['*']
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': get_secret('POSTGRES_DB'),
        'USER': get_secret('POSTGRES_USER'),
        'PASSWORD': get_secret('POSTGRES_PASSWORD'),
        'HOST': get_secret('POSTGRES_HOST'),
        'PORT': '5432',
    }
}

# STATIC_ROOT = os.path.join(BASE_DIR, "static/assets")
# STATIC_URL = 'https://static.swapeh.xyz/assets/'

# MEDIA_ROOT = os.path.join(BASE_DIR, "static/media")
# MEDIA_URL = 'https://static.swapeh.xyz/media/'
