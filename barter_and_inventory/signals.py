# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : signals.py
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 12/10/2021 3:21 PM
# @Desc   :
# '''=================================================
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from barter_and_inventory.models import Profile, OfferBid, Offer


@receiver(post_save, sender=User)
def update_user_profile(sender, instance: User, created, **kwargs):
    print("executing update_user_profile signal")
    if created:
        if not instance.is_superuser or not instance.is_staff:
            Profile.objects.create(user=instance)
    if hasattr(instance, 'profile'):
        instance.profile.save()


@receiver(post_save, sender=OfferBid)
def create_offer_bid_handler(sender, instance: OfferBid, created, **kwargs):
    print("executing create_offer_bid_handler signal")
    if created:
        instance.offer.offer_status = Offer.OfferStatus.NEGOTIATION
        instance.bid_offer.offer_status = Offer.OfferStatus.NEGOTIATION
        instance.offer.save()
        instance.bid_offer.save()

