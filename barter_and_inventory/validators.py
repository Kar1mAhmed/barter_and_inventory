# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : validators
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 12/10/2021 6:01 AM
# @Desc   :
# '''=================================================
from django.core.exceptions import ValidationError


def validate_image_size(image):
    max_height = 1920
    max_width = 1080
    height = image.file.height
    width = image.file.width
    if width > max_width or height > max_height:
        raise ValidationError("Height or Width is larger than 1920 X 1080")