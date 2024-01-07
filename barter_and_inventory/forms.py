# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : forms.py
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 11/10/2021 11:43 PM
# @Desc   :
# '''=================================================
import datetime

from django import forms
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm, SetPasswordForm, PasswordResetForm, PasswordChangeForm
from django.contrib.auth.models import User, Group
from django.core.exceptions import ValidationError
from django.core.validators import FileExtensionValidator
from django.utils import timezone

from barter_and_inventory.models import Product, Offer, OfferBid, OTP


class LoginForm(AuthenticationForm):
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control floating'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control floating'}))
    

class OTPForm(forms.ModelForm):
    otp = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control floating'}))

    class Meta:
        model = OTP  
        fields = ['otp']


class ResetPasswordForm(SetPasswordForm):
    new_password1 = forms.CharField(label="New password", widget=forms.PasswordInput(attrs={'class': 'form-control floating'}))
    new_password2 = forms.CharField(label="New password confirmation", widget=forms.PasswordInput(attrs={'class': 'form-control floating'}))


class ChangePasswordForm(PasswordChangeForm):
    old_password = forms.CharField(label="Old password", widget=forms.PasswordInput(attrs={'class': 'form-control floating'}))
    new_password1 = forms.CharField(label="New password", widget=forms.PasswordInput(attrs={'class': 'form-control floating'}))
    new_password2 = forms.CharField(label="New password confirmation", widget=forms.PasswordInput(attrs={'class': 'form-control floating'}))


class PasswordResetRequestForm(PasswordResetForm):
    email = forms.CharField(widget=forms.EmailInput(attrs={'class': 'form-control floating'}))


class SignupForm(UserCreationForm):
    birth_date = forms.DateField(input_formats=['%d/%m/%Y'], widget=forms.DateInput(attrs={'class': 'form-control floating datetimepicker'}, format="%d/%m/%Y"),
                                 help_text='Required. Format: DD/MM/YYYY')
    email = forms.EmailField(max_length=254, widget=forms.EmailInput(attrs={'class': 'form-control floating'}),
                             help_text='Required. Inform a valid email address.')
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control floating'}))
    first_name = forms.CharField(label="First Name", widget=forms.TextInput(attrs={'class': 'form-control floating'}))
    last_name = forms.CharField(label="Last Name", widget=forms.TextInput(attrs={'class': 'form-control floating'}))
    password1 = forms.CharField(label="Password", widget=forms.PasswordInput(attrs={'class': 'form-control floating'}))
    password2 = forms.CharField(label="Repeat Password", widget=forms.PasswordInput(attrs={'class': 'form-control floating'}))
    error_messages = {
        'email_already_exists': 'User with this email already exists.',
        'password_mismatch': 'The two password fields didn’t match.',
    }

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'birth_date', 'password1', 'password2',)

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email):
            raise ValidationError(
                self.error_messages['email_already_exists'],
                code='email_already_exists',
            )
        return email

    def save(self, commit=True):
        created_user = super(SignupForm, self).save(commit)
        group = Group.objects.get(name='frontend_user')
        created_user.groups.add(group)
        return created_user


class AddProductForm(forms.ModelForm):
    product_photos = forms.FileField(validators=[FileExtensionValidator(allowed_extensions=['png', 'jpeg', 'jpg'])],
                                     widget=forms.ClearableFileInput(attrs={'multiple': True}))

    class Meta:
        model = Product
        fields = (
            'product_title', 'product_description', 'product_quantity', 'product_photos', 'product_condition', 'price_per_unit', 'price_currency',
            'product_categories',
        )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
        self.fields['product_condition'].widget.attrs.update({'class': 'form-control select'})
        self.fields['price_currency'].widget.attrs.update({'class': 'form-control select'})


class ProfileUpdateForm(forms.ModelForm):
    birth_date = forms.DateField(widget=forms.DateInput(attrs={'class': 'form-control floating', 'id': 'id_birth_date3'}, format="%d/%m/%Y"),
                                 help_text='Required. Format: DD/MM/YYYY')
    first_name = forms.CharField(label="First Name", widget=forms.TextInput(attrs={'class': 'form-control floating'}))
    last_name = forms.CharField(label="Last Name", widget=forms.TextInput(attrs={'class': 'form-control floating'}))
    bio = forms.CharField(required=False,max_length=400, label="Bio", widget=forms.Textarea(attrs={'class': 'form-control floating'}))
    location = forms.CharField(required=False,max_length=999, label="Address", widget=forms.Textarea(attrs={'class': 'form-control floating'}))
    email = forms.EmailField(disabled=True, max_length=254, widget=forms.EmailInput(attrs={'class': 'form-control floating', 'readOnly': True}),
                             help_text='Required. Inform a valid email address.')
    username = forms.CharField(disabled=True, widget=forms.TextInput(attrs={'class': 'form-control floating', 'readOnly': True}))
    profile_picture = forms.FileField(required=False, validators=[FileExtensionValidator(allowed_extensions=['png', 'jpeg', 'jpg'])],
                                      widget=forms.ClearableFileInput(
                                          attrs={'class': 'upload', 'type': 'file', 'accept': 'image/jpeg, image/jpeg, image/png'}))

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'birth_date', 'bio', 'location')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['bio'].initial = self.instance.profile.bio
        self.fields['location'].initial = self.instance.profile.location

    def save(self, commit=True):
        updated_user = super(ProfileUpdateForm, self).save(commit)
        updated_user.profile.bio = self.cleaned_data.get('bio', self.instance.profile.bio)
        updated_user.profile.profile_picture = self.cleaned_data.get('profile_picture', self.instance.profile.profile_picture)
        updated_user.profile.birth_date = self.cleaned_data.get('birth_date', self.instance.profile.birth_date)
        updated_user.profile.location = self.cleaned_data.get('location', self.instance.profile.birth_date)
        updated_user.save()
        return updated_user


class AddOfferForm(forms.ModelForm):
    product_with_quantity = forms.JSONField(required=True, error_messages={'required': 'You should select one of you products and define the quantity'})
    class Meta:
        model = Offer
        fields = (
            'offer_title', 'offer_description', 'estimated_cost', 'estimated_cost_currency', 'includes_cash', 'cash_in_hand', 'cash_in_hand_currency',
            'shipment_method', 'shipment_address', 'product_with_quantity'
        )

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user')  # type: User
        super(AddOfferForm, self).__init__(*args, **kwargs)
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'


class PlaceBidForm(forms.ModelForm):

    class Meta:
        model = OfferBid
        fields = ('offer', 'bid_offer',)


class AcceptBidForm(forms.ModelForm):
    offer = forms.IntegerField(required=True)

    class Meta:
        model = Offer
        fields = ('exchanged_with', 'offer',)

    def save(self, commit=True):
        offer_object = Offer.objects.get(pk=self.cleaned_data['offer'])
        offer_object.exchanged_with = self.cleaned_data['exchanged_with']
        offer_object.exchanged_with.offer_status = Offer.OfferStatus.CLOSED
        offer_object.offer_status = Offer.OfferStatus.CLOSED
        time_now = timezone.now()
        offer_object.exchange_date = time_now
        offer_object.exchanged_with.exchange_date = time_now
        offer_object.exchanged_with.exchanged_with = offer_object
        offer_object.exchanged_with.save()
        offer_object.save()
        return offer_object

