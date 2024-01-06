# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : admin.py
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 11/10/2021 3:52 PM
# @Desc   :
# '''=================================================

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from barter_and_inventory.models import Profile, Product, Offer, Category, OfferProduct, ProductPicture, OfferBid, OTP


class UserCustomAdmin(UserAdmin):
    list_display = ['id', 'username', 'email', 'first_name', 'last_name', 'email_confirmed', 'is_active', 'last_login']

    def email_confirmed(self, instance):
        if hasattr(instance, 'profile'):
            return instance.profile.email_confirmed
        return False
    email_confirmed.boolean = True


admin.site.unregister(User)
admin.site.register(OTP)
admin.site.register(User, UserCustomAdmin)
admin.site.register(Profile)
admin.site.register(Product)
admin.site.register(Offer)
admin.site.register(Category)
admin.site.register(OfferProduct)
admin.site.register(ProductPicture)
admin.site.register(OfferBid)

