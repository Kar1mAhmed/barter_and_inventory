# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : apps.py
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 11/10/2021 3:52 PM
# @Desc   :
# '''=================================================

from django.apps import AppConfig


class BarterAndInventoryConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'barter_and_inventory'

    def ready(self):
        import barter_and_inventory.signals
