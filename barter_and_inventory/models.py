# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : models.py
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 11/10/2021 3:52 PM
# @Desc   :
# '''=================================================
import os
from unicodedata import decimal
import random

from django.contrib.auth.models import User
from django.core.validators import FileExtensionValidator
from django.db import models

from barter_and_inventory.utils import user_profile_picture_upload_handler, initials_color_code_generator, product_photo_upload_handler
from barter_and_inventory.validators import validate_image_size


class Profile(models.Model):

    class Meta:
        verbose_name = "Profile"
        verbose_name_plural = "Profiles"

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    bio = models.TextField(max_length=500, blank=True)
    location = models.TextField(max_length=1000, blank=True)
    birth_date = models.DateField(null=True, blank=True)
    email_confirmed = models.BooleanField(default=False, blank=True)
    profile_picture = models.ImageField(blank=True, null=True, upload_to=user_profile_picture_upload_handler, validators=[
        FileExtensionValidator(allowed_extensions=['png', 'jpeg', 'jpg']),
        validate_image_size
    ])
    initial_color = models.CharField(max_length=255, null=True, blank=True, default=initials_color_code_generator)

    def __str__(self):
        return self.user.username


class OTP(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    otp = models.CharField(max_length=8)
    updated_at = models.DateTimeField(auto_now=True)
    
    def create_otp(self):
        self.otp= str(random.randint(100000, 999999))
        self.save(update_fields=['otp'])
    
    def verify_otp(self, entered_otp):
        if str(entered_otp) == self.otp:
            return True
        return False


class Category(models.Model):

    class Meta:
        verbose_name = "Category"
        verbose_name_plural = "Categories"

    class CategoryStatus(models.TextChoices):
        ACTIVE = 'ACTIVE', 'Active'
        IN_ACTIVE = 'IN_ACTIVE', 'In-active'

    category_title = models.CharField(max_length=400)
    category_status = models.CharField(max_length=255, choices=CategoryStatus.choices, default=CategoryStatus.ACTIVE)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='category_created_by')
    updated_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name='category_updated_by')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def get_category_status(self) -> CategoryStatus:
        return CategoryStatus[self.category_status]

    def __str__(self):
        return self.category_title


class Product(models.Model):

    class Meta:
        verbose_name = "Product"
        verbose_name_plural = "Products"

    class ProductCondition(models.TextChoices):
        NEW = 'NEW', 'New'
        USED = 'USED', 'Used'

    class ProductPriceCurrency(models.TextChoices):
        PKR = 'PKR', 'Pakistani Rupees'
        INR = 'INR', 'Indian Rupees'
        EUR = 'EUR', 'Euros'
        USD = 'USD', 'United Stated Dollar'
        CAD = 'CAD', 'Canadian Dollar'
        GBP = 'GBP', 'British Pound'
        JPY = 'JPY', 'Japanese Yen'
        CHF = 'CHF', 'Swiss Franc'

    class ProductStatus(models.TextChoices):
        OUT_OF_STOCK = 'OUT_OF_STOCK', 'Out of stock'
        AVAILABLE = 'AVAILABLE', 'Available'

    product_title = models.CharField(max_length=400)
    product_description = models.TextField(null=True, blank=True, max_length=1000)
    product_quantity = models.IntegerField(default=1)
    product_condition = models.CharField(max_length=10, choices=ProductCondition.choices, default=ProductCondition.NEW)
    price_per_unit = models.DecimalField(max_digits=7, decimal_places=2, default=0.00)
    price_currency = models.CharField(max_length=255, choices=ProductPriceCurrency.choices, default=ProductPriceCurrency.USD)
    product_status = models.CharField(max_length=255, choices=ProductStatus.choices, default=ProductStatus.AVAILABLE)
    product_categories = models.ManyToManyField(Category, related_name='categories')
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='product_created_by')
    updated_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name='product_updated_by')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def get_product_condition(self) -> ProductCondition:
        return ProductCondition[self.product_condition]

    def get_price_currency(self) -> ProductPriceCurrency:
        return ProductPriceCurrency[self.price_currency]

    def get_product_status(self) -> ProductStatus:
        return ProductStatus[self.product_status]

    def get_total_product_stock_price(self):
        return self.price_per_unit * decimal(self.product_quantity)

    def __str__(self):
        return self.product_title


class ProductPicture(models.Model):

    class Meta:
        verbose_name = "Product Photo"
        verbose_name_plural = "Product Photos"

    product_photo = models.ImageField(upload_to=product_photo_upload_handler, validators=[
        FileExtensionValidator(allowed_extensions=['png', 'jpeg', 'jpg']),
    ])
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='product_photos')
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='product_picture_created_by')
    updated_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name='product_picture_updated_by')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return os.path.basename(self.product_photo.name)

    def filename(self):
        return os.path.basename(self.product_photo.name)


class Offer(models.Model):

    class Meta:
        verbose_name = "Offer"
        verbose_name_plural = "Offers"

    class EstimatedCostCurrency(models.TextChoices):
        PKR = 'PKR', 'Pakistani Rupees'
        INR = 'INR', 'Indian Rupees'
        EUR = 'EUR', 'Euros'
        USD = 'USD', 'United Stated Dollar'
        CAD = 'CAD', 'Canadian Dollar'
        GBP = 'GBP', 'British Pound'
        JPY = 'JPY', 'Japanese Yen'
        CHF = 'CHF', 'Swiss Franc'

    class OfferStatus(models.TextChoices):
        OPEN = 'OPEN', 'Open'
        NEGOTIATION = 'NEGOTIATION', 'Negotiation'
        CANCELLED = 'CANCELLED', 'Cancelled'
        CLOSED = 'CLOSED', 'Closed'

    class ShipmentMethod(models.TextChoices):
        SELF_PICKUP = 'SELF_PICKUP', 'Self Pickup'
        TRANSPORT = 'TRANSPORT', 'Transport'
        COURIER = 'COURIER', 'Courier'

    offer_title = models.CharField(max_length=400)
    offer_description = models.TextField(max_length=1000)
    estimated_cost = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    estimated_cost_currency = models.CharField(max_length=255, choices=EstimatedCostCurrency.choices, default=EstimatedCostCurrency.USD)
    includes_cash = models.BooleanField(default=False)
    cash_in_hand = models.DecimalField(max_digits=10, null=True, blank=True, decimal_places=2)
    cash_in_hand_currency = models.CharField(max_length=255, null=True, blank=True, choices=EstimatedCostCurrency.choices,
                                             default=EstimatedCostCurrency.USD)
    exchanged_with = models.ForeignKey('self', on_delete=models.RESTRICT, null=True, blank=True, related_name='exchanged_with_offer')
    exchange_date = models.DateTimeField(null=True, blank=True)
    shipment_method = models.CharField(max_length=255, null=True, blank=True, choices=ShipmentMethod.choices, default=ShipmentMethod.SELF_PICKUP)
    offer_status = models.CharField(max_length=255, null=True, blank=True, choices=OfferStatus.choices, default=OfferStatus.OPEN)
    shipment_address = models.CharField(max_length=500, null=True, blank=True)
    final_remarks = models.TextField(null=True, blank=True, max_length=500)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='offer_created_by')
    updated_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name='offer_updated_by')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.offer_title


class OfferProduct(models.Model):

    class Meta:
        verbose_name = "Offer Product"
        verbose_name_plural = "Offer Products"

    offer = models.ForeignKey(Offer, on_delete=models.CASCADE, related_name='offered_products')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='product_offer')
    product_quantity = models.IntegerField(default=1)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='offer_product_created_by')
    updated_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name='offer_product_updated_by')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.product.product_title


class OfferBid(models.Model):

    class Meta:
        verbose_name = "Offer Bid"
        verbose_name_plural = "Offer Bids"

    offer = models.ForeignKey(Offer, on_delete=models.CASCADE, related_name='against_offer')
    bid_offer = models.ForeignKey(Offer, on_delete=models.CASCADE, related_name='bid_offer')
    created_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='bid_created_by')
    updated_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.CASCADE, related_name='bid_updated_by')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.offer.offer_title

