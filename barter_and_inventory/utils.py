# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : utils.py
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 12/10/2021 5:56 AM
# @Desc   :
# '''=================================================
import datetime
import random


def user_profile_picture_upload_handler(instance, filename):
    f_path = f"user-avatars/{instance.user.pk}/{filename}"
    return f_path


def product_photo_upload_handler(instance, filename):
    f_path = f"product-photos/{instance.product_id}/{filename}"
    return f_path


def initials_color_code_generator():
    random_int = lambda: random.randint(0, 255)
    result = '#%02X%02X%02X' % (random_int(), random_int(), random_int())
    if result.lower() == '#acacac' or result.lower() == '#ffffff' or result.lower() == '#7b7b7b':
        return initials_color_code_generator()
    else:
        return result


def items_this_years(query_results, key):
    _year_data = []
    for i in range(1, 13):
        found = False
        for item in query_results:
            item_month = item['month']  # type: datetime.datetime
            if item_month.month == i:
                print(f"i: {i}, item: {item_month.month}")
                found = True
                _year_data.append({"month": item_month.strftime('%b'), key: item['total']})
                break
        if not found:
            _year_data.append({"month": datetime.date(datetime.datetime.now().year, i, 1).strftime('%b'), key: 0})
    return _year_data