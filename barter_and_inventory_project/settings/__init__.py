# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : __init__.py
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 11/10/2021 3:52 PM
# @Desc   :
# '''=================================================
import os
from .utils import get_secret
from .base import *
# if get_secret('PROJECT_ENVIRONMENT') == 'prod':
#     print('using prod settings')
#     from .prod import *
# else:
#     print('using dev settings')
from .dev import *
