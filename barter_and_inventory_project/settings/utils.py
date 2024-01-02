# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter-system
# @File   : utils
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 20/01/2022 1:43 AM
# @Desc   :
# '''=================================================
import os
from django.core.exceptions import ImproperlyConfigured


def get_secret(key, default=None):
    secret = os.getenv(key=key, default=default)
    if secret is None:
        raise ImproperlyConfigured(f'Set the {key} secret environment variable')
    return secret