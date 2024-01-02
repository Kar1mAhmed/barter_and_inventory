# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : dev
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 11/10/2021 5:00 PM
# @Desc   :
# '''=================================================
import os
from pathlib import Path

from barter_and_inventory_project.settings import get_secret

BASE_DIR = Path(__file__).resolve().parent.parent.parent
SECRET_KEY = 'django-insecure-0a+#j8*bh23au299(gy=#o45g&&rqjux*r^)8h--rq^d5zwoz1'
DEBUG = True

ALLOWED_HOSTS = ['*']

# dev.py file
DATABASES = {
    'default': {
        
        # !!! Should be commented when using the real database
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
        
        # !!! Should be uncommented when using the real database
        # 'ENGINE': 'django.db.backends.postgresql',
        # 'NAME': get_secret('POSTGRES_DB'),
        # 'USER': get_secret('POSTGRES_USER'),
        # 'PASSWORD': get_secret('POSTGRES_PASSWORD'),
        # 'HOST': get_secret('POSTGRES_HOST'),
        # 'PORT': '5432',
    }
}

