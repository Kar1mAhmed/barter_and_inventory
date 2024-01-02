# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : views.py
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 11/10/2021 3:52 PM
# @Desc   :
# '''=================================================
import datetime
import json

from django.contrib.auth import login as auth_login, logout as auth_logout
from django.contrib.auth.mixins import PermissionRequiredMixin
from django.contrib.auth.models import User
from django.contrib.auth.tokens import default_token_generator
from django.contrib.auth.views import LoginView, PasswordResetConfirmView, PasswordResetCompleteView, PasswordResetDoneView, PasswordChangeView
from django.contrib.sites.shortcuts import get_current_site
from django.core.exceptions import ValidationError
from django.core.mail import BadHeaderError
from django.db import transaction
from django.db.models import Q, Subquery, OuterRef, Count
from django.db.models.functions import TruncMonth
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.template.loader import render_to_string
from django.urls import reverse_lazy
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.views import View
from django.views.generic import TemplateView, FormView, RedirectView, UpdateView, ListView, DeleteView, DetailView

from barter_and_inventory.forms import LoginForm, SignupForm, ResetPasswordForm, PasswordResetRequestForm, AddProductForm, ProfileUpdateForm, \
    ChangePasswordForm, AddOfferForm, PlaceBidForm, AcceptBidForm
from barter_and_inventory.mixins import FrontendUserViewMixin
from barter_and_inventory.models import Product, ProductPicture, Offer, OfferProduct, OfferBid, Category
from barter_and_inventory.tokens import account_activation_token
from barter_and_inventory.utils import items_this_years


class BarterLoginView(LoginView):
    template_name = 'barter_and_inventory/login.html'
    authentication_form = LoginForm
    redirect_field_name = 'redirects_to'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def get_success_url(self):
        return reverse_lazy('barter_and_inventory:dashboard')

    def form_valid(self, form):
        user = form.get_user()
        person = User.objects.get(username=user)
        if person.groups.filter(name='frontend_user').exists():
            auth_login(self.request, form.get_user())
            return HttpResponseRedirect(self.get_success_url())
        else:
            form.add_error(None, ValidationError("You're not authorized to login to this console"))
            return super(BarterLoginView, self).form_invalid(form=form)


class LogoutView(RedirectView):
    def get_redirect_url(self, *args, **kwargs):
        return reverse_lazy('barter_and_inventory:index')

    def get(self, request, *args, **kwargs):
        auth_logout(request)
        return super(LogoutView, self).get(request, *args, **kwargs)


class DashboardView(FrontendUserViewMixin, TemplateView):
    template_name = 'barter_and_inventory/dashboard.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user  # type: User
        context['total_products'] = user.product_created_by.all().count()
        context['total_offers'] = user.offer_created_by.all().count()
        context['total_bids_placed_placed'] = user.bid_created_by.all().count()
        context['total_bids_placed_received'] = user.offer_created_by.filter(against_offer__isnull=False).count()
        this_year_products_query = user.product_created_by.filter(created_at__year=datetime.datetime.now().year).annotate(
            month=TruncMonth('created_at')).values('month').annotate(total=Count('pk'))
        previous_year_products_query = user.product_created_by.filter(created_at__year=datetime.datetime.now().year - 1).annotate(
            month=TruncMonth('created_at')).values('month').annotate(total=Count('pk'))
        context['products_this_year'] = items_this_years(this_year_products_query, 'products')
        context['products_previous_year'] = items_this_years(previous_year_products_query, 'products')

        this_year_offers_query = user.offer_created_by.filter(created_at__year=datetime.datetime.now().year).annotate(
            month=TruncMonth('created_at')).values('month').annotate(total=Count('pk'))
        previous_year_offers_query = user.offer_created_by.filter(created_at__year=datetime.datetime.now().year - 1).annotate(
            month=TruncMonth('created_at')).values('month').annotate(total=Count('pk'))
        context['offers_this_year'] = items_this_years(this_year_offers_query, 'offers')
        context['offers_previous_year'] = items_this_years(previous_year_offers_query, 'offers')
        return context


class SignupView(FormView):
    form_class = SignupForm
    template_name = 'barter_and_inventory/signup.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def get_success_url(self):
        return reverse_lazy('barter_and_inventory:account_activation_sent')

    def form_valid(self, form):
        created_user = form.save(commit=True)
        created_user.refresh_from_db()
        created_user.profile.birth_date = form.cleaned_data['birth_date']
        created_user.save()
        current_site = get_current_site(self.request)
        subject = 'Activate Your Bart & Inventory Account'
        message = render_to_string('barter_and_inventory/account_activation_email.html', {
            'user': created_user,
            'domain': current_site.domain,
            'uid': urlsafe_base64_encode(force_bytes(created_user.pk)),
            'token': account_activation_token.make_token(created_user),
        })
        created_user.email_user(subject, message)
        return HttpResponseRedirect(self.get_success_url())


class AccountActivationSentView(TemplateView):
    template_name = 'barter_and_inventory/account_activation_sent.html'


class ActivateView(View):

    def get(self, request, *args, **kwargs):
        uidb64 = kwargs.get('uidb64')
        token = kwargs.get('token')
        try:
            uid = force_text(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=uid)
        except (TypeError, ValueError, OverflowError, User.DoesNotExist):
            user = None

        if user is not None and account_activation_token.check_token(user, token):
            user.is_active = True
            user.profile.email_confirmed = True
            user.save()
            auth_login(request, user)
            return redirect('barter_and_inventory:dashboard')
        else:
            return render(request, 'barter_and_inventory/account_activation_invalid.html')


class PasswordResetRequestView(FormView):
    form_class = PasswordResetRequestForm
    template_name = 'barter_and_inventory/forgot_password.html'
    success_url = reverse_lazy('barter_and_inventory:reset_password_request_sent')

    def form_valid(self, form):
        current_site = get_current_site(self.request)
        subject = 'Password Reset Requested'
        email_template_name = "barter_and_inventory/reset_password_email.html"
        email = form.cleaned_data['email']
        associated_users = User.objects.filter(Q(email=email))
        if associated_users.exists():
            for user in associated_users:
                c = {
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                    'user': user,
                    'token': default_token_generator.make_token(user)
                }
                email = render_to_string(email_template_name, c)
                try:
                    user.email_user(subject, email)
                except BadHeaderError:
                    return HttpResponse('Invalid header found.')
                return HttpResponseRedirect(self.get_success_url())
        return super(PasswordResetRequestView, self).form_valid(form)


class PasswordResetRequestSentView(PasswordResetDoneView):
    template_name = 'barter_and_inventory/reset_password_request_sent.html'


class PasswordResetConfirm(PasswordResetConfirmView):
    form_class = ResetPasswordForm
    success_url = reverse_lazy('barter_and_inventory:reset_password_complete')
    template_name = 'barter_and_inventory/reset_password.html'


class PasswordResetComplete(PasswordResetCompleteView):
    template_name = 'barter_and_inventory/reset_password_complete.html'


class ProductsListView(FrontendUserViewMixin, PermissionRequiredMixin, ListView):
    template_name = 'barter_and_inventory/products/list.html'
    permission_denied_message = "You're not authorized to view products."
    permission_required = 'barter_and_inventory.view_product'
    context_object_name = 'products'

    def get_queryset(self):
        user = self.request.user  # type: User
        queryset = user.product_created_by.all()
        product_title_val = self.request.GET.get('product_title', None)
        category_val = self.request.GET.get('category', None)
        created_date_from = self.request.GET.get('created_date_from', None)
        created_date_to = self.request.GET.get('created_date_to', None)
        order = self.request.GET.get('order_by', '-id')
        if product_title_val:
            queryset = queryset.filter(product_title__icontains=product_title_val).order_by(order)
        if category_val:
            queryset = queryset.filter(product_categories__in=[category_val]).order_by(order)
        if created_date_from:
            created_date_from_filter = datetime.datetime.strptime(created_date_from + " 00:00:00", '%d/%m/%Y %H:%M:%S')
            queryset = queryset.filter(created_at__gte=created_date_from_filter).order_by(order)
        if created_date_to:
            created_date_to_filter = datetime.datetime.strptime(created_date_to + " 00:00:00", '%d/%m/%Y %H:%M:%S')
            queryset = queryset.filter(created_at__lte=created_date_to_filter).order_by(order)
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = self.request.GET.get('category', None)
        context['categories'] = Category.objects.all()
        context['product_title'] = self.request.GET.get('product_title', None)
        context['created_date_from'] = self.request.GET.get('created_date_from', None)
        context['created_date_to'] = self.request.GET.get('created_date_to', None)
        context['order_by'] = self.request.GET.get('order_by', '-id')
        return context


class AddProductView(FrontendUserViewMixin, PermissionRequiredMixin, FormView):
    permission_required = 'barter_and_inventory.add_product'
    permission_denied_message = "You're not authorized to add product."
    form_class = AddProductForm
    success_url = reverse_lazy('barter_and_inventory:view_products')
    template_name = 'barter_and_inventory/products/add.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user  # type: User
        return context

    def form_valid(self, form):
        with transaction.atomic():
            form.instance.created_by = self.request.user
            files = self.request.FILES.getlist('product_photos')
            created_product = form.save(commit=True)  # type: Product
            for f in files:
                ProductPicture.objects.create(product_photo=f, created_by=self.request.user, product=created_product)
        return super(AddProductView, self).form_valid(form)

    def form_invalid(self, form):
        return super(AddProductView, self).form_invalid(form)


class EditProductView(FrontendUserViewMixin, PermissionRequiredMixin, UpdateView):
    permission_required = 'barter_and_inventory.change_product'
    permission_denied_message = "You're not authorized to edit product."
    model = Product
    form_class = AddProductForm
    success_url = reverse_lazy('barter_and_inventory:view_products')
    template_name = 'barter_and_inventory/products/add.html'

    def get_form(self, form_class=None):
        form = super(EditProductView, self).get_form(form_class)
        form.fields['product_photos'].required = False
        return form

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user  # type: User
        context['is_edit'] = True
        return context

    def get_object(self, queryset=None):
        return get_object_or_404(self.model, pk=self.kwargs['pk'])

    def form_valid(self, form):
        with transaction.atomic():
            form.instance.updated_by = self.request.user
            form.instance.updated_at = datetime.datetime.now()
            files = self.request.FILES.getlist('product_photos')
            updated_product = form.save(commit=True)  # type: Product
            if files:
                for f in files:
                    ProductPicture.objects.create(product_photo=f, created_by=self.request.user, product=updated_product)
        return super(EditProductView, self).form_valid(form)

    def form_invalid(self, form):
        return super(EditProductView, self).form_invalid(form)


class DeleteProductPhotoView(FrontendUserViewMixin, PermissionRequiredMixin, DeleteView):
    permission_required = 'barter_and_inventory.delete_productpicture'
    permission_denied_message = "You're not authorized to delete product photo."
    model = ProductPicture
    template_name = 'barter_and_inventory/product_photos/delete.html'

    def post(self, request, *args, **kwargs):
        _obj = self.get_object()
        product = _obj.product
        _obj.delete()
        return HttpResponseRedirect(reverse_lazy('barter_and_inventory:edit_product', kwargs={'pk': product.pk}))

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user  # type: User
        return context

    def get_object(self, queryset=None):
        return get_object_or_404(self.model, pk=self.kwargs['pk'], product__created_by=self.request.user)


class DeleteProductView(FrontendUserViewMixin, PermissionRequiredMixin, DeleteView):
    permission_required = 'barter_and_inventory.delete_product'
    permission_denied_message = "You're not authorized to delete product."
    model = Product
    success_url = reverse_lazy('barter_and_inventory:view_products')
    template_name = 'barter_and_inventory/products/delete.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user  # type: User
        return context

    def get_object(self, queryset=None):
        return get_object_or_404(self.model, pk=self.kwargs['pk'], created_by=self.request.user)


class ProductDetailView(FrontendUserViewMixin, PermissionRequiredMixin, DetailView):
    permission_required = 'barter_and_inventory.view_product'
    permission_denied_message = "You're not authorized to view product."
    template_name = 'barter_and_inventory/products/detail.html'
    model = Product

    def get_object(self, queryset=None):
        return get_object_or_404(self.model, pk=self.kwargs['pk'], created_by=self.request.user)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


class EditProfileView(FrontendUserViewMixin, PermissionRequiredMixin, UpdateView):
    permission_required = 'barter_and_inventory.change_profile'
    permission_denied_message = "You're not authorized to edit profile."
    model = User
    form_class = ProfileUpdateForm
    success_url = reverse_lazy('barter_and_inventory:view_profile')
    template_name = 'barter_and_inventory/profile/edit.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def get_object(self, queryset=None):
        return self.request.user

    def form_valid(self, form):
        return super(EditProfileView, self).form_valid(form)

    def form_invalid(self, form):
        return super(EditProfileView, self).form_invalid(form)


class ProfileDetailView(FrontendUserViewMixin, PermissionRequiredMixin, DetailView):
    permission_required = 'barter_and_inventory.view_product'
    permission_denied_message = "You're not authorized to view product."
    template_name = 'barter_and_inventory/profile/view.html'
    model = User

    def get_queryset(self):
        return self.model.objects.filter(created_by=self.request.user)

    def get_object(self, queryset=None):
        return self.request.user

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


class SettingPasswordChangeView(FrontendUserViewMixin, PermissionRequiredMixin, PasswordChangeView):
    permission_required = 'barter_and_inventory.change_profile'
    permission_denied_message = "You're not authorized to change your password."
    template_name = 'barter_and_inventory/profile/change_password.html'
    success_url = reverse_lazy('barter_and_inventory:view_profile')

    def get_object(self, queryset=None):
        return self.request.user

    def get_form_class(self):
        return ChangePasswordForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def form_valid(self, form):
        return super(SettingPasswordChangeView, self).form_valid(form)

    def form_invalid(self, form):
        return super(SettingPasswordChangeView, self).form_invalid(form)


class OffersListView(FrontendUserViewMixin, PermissionRequiredMixin, ListView):
    template_name = 'barter_and_inventory/offers/list.html'
    permission_denied_message = "You're not authorized to view offers."
    permission_required = 'barter_and_inventory.view_offer'
    context_object_name = 'offers'

    def get_queryset(self):
        user = self.request.user  # type: User
        queryset = user.offer_created_by.all()
        offer_title_val = self.request.GET.get('offer_title', None)
        category_val = self.request.GET.get('category', None)
        created_date_from = self.request.GET.get('created_date_from', None)
        created_date_to = self.request.GET.get('created_date_to', None)
        order = self.request.GET.get('order_by', '-id')
        if offer_title_val:
            queryset = queryset.filter(offer_title__icontains=offer_title_val).order_by(order)
        if category_val:
            queryset = queryset.filter(offered_products__product__product_categories__in=[category_val]).order_by(order)
        if created_date_from:
            created_date_from_filter = datetime.datetime.strptime(created_date_from + " 00:00:00", '%d/%m/%Y %H:%M:%S')
            queryset = queryset.filter(created_at__gte=created_date_from_filter).order_by(order)
        if created_date_to:
            created_date_to_filter = datetime.datetime.strptime(created_date_to + " 00:00:00", '%d/%m/%Y %H:%M:%S')
            queryset = queryset.filter(created_at__lte=created_date_to_filter).order_by(order)
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = self.request.GET.get('category', None)
        context['categories'] = Category.objects.all()
        context['offer_title'] = self.request.GET.get('offer_title', None)
        context['created_date_from'] = self.request.GET.get('created_date_from', None)
        context['created_date_to'] = self.request.GET.get('created_date_to', None)
        context['order_by'] = self.request.GET.get('order_by', '-id')
        return context


class ExchangeableOffersListView(FrontendUserViewMixin, PermissionRequiredMixin, FormView):
    template_name = 'barter_and_inventory/offers/exchangeable_offers.html'
    permission_denied_message = "You're not authorized to view offers."
    permission_required = 'barter_and_inventory.view_offer'
    form_class = PlaceBidForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        request_user = self.request.user  # type: User
        context['bid_against_offer'] = self.kwargs.get('bid_against_offer')
        context['offers'] = request_user.offer_created_by.filter(offer_status__in=[Offer.OfferStatus.OPEN, Offer.OfferStatus.NEGOTIATION])
        return context

    def form_valid(self, form):
        form.instance.created_by = self.request.user
        context = self.get_context_data()
        offer = form.cleaned_data['bid_offer']
        form.save(commit=True)
        return HttpResponseRedirect(reverse_lazy('barter_and_inventory:view_offer_detail', kwargs={'pk': offer.pk}))


class AddOfferView(FrontendUserViewMixin, PermissionRequiredMixin, FormView):
    permission_required = 'barter_and_inventory.add_offer'
    permission_denied_message = "You're not authorized to add offer."
    form_class = AddOfferForm
    success_url = reverse_lazy('barter_and_inventory:view_offers')
    template_name = 'barter_and_inventory/offers/add.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user  # type: User
        context['user_available_products'] = user.product_created_by.filter(product_quantity__gte=1)
        return context

    def get_form_kwargs(self):
        kwargs = super(AddOfferView, self).get_form_kwargs()
        kwargs.update({'user': self.request.user})
        return kwargs

    def form_valid(self, form):
        with transaction.atomic():
            form.instance.created_by = self.request.user
            json_data = json.loads(json.dumps(form.cleaned_data['product_with_quantity']))
            created_offer = form.save(commit=True)  # type: Offer
            for item in json_data:
                OfferProduct.objects.create(offer=created_offer, product_id=item['product_id'], product_quantity=item['quantity'],
                                            created_by=self.request.user)

        return super(AddOfferView, self).form_valid(form)

    def form_invalid(self, form):
        return super(AddOfferView, self).form_invalid(form)


class OfferDetailView(FrontendUserViewMixin, PermissionRequiredMixin, DetailView):
    permission_required = 'barter_and_inventory.view_offer'
    permission_denied_message = "You're not authorized to view offer."
    template_name = 'barter_and_inventory/offers/detail.html'
    model = Offer

    def get_queryset(self):
        return self.model.objects.filter(created_by=self.request.user)

    def get_object(self, queryset=None):
        return get_object_or_404(self.model, pk=self.kwargs['pk'], created_by=self.request.user)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


class EditOfferView(FrontendUserViewMixin, PermissionRequiredMixin, UpdateView):
    # todo
    permission_required = 'barter_and_inventory.change_offer'
    permission_denied_message = "You're not authorized to add offer."
    model = Offer
    form_class = AddOfferForm
    success_url = reverse_lazy('barter_and_inventory:view_offers')
    template_name = 'barter_and_inventory/offers/add.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user  # type: User
        context['user_available_products'] = user.product_created_by.filter(product_quantity__gte=1)
        return context

    def get_form_kwargs(self):
        kwargs = super(EditOfferView, self).get_form_kwargs()
        kwargs.update({'user': self.request.user})
        return kwargs

    def form_valid(self, form):
        with transaction.atomic():
            form.instance.created_by = self.request.user
            json_data = json.loads(json.dumps(form.cleaned_data['product_with_quantity']))
            created_offer = form.save(commit=True)  # type: Offer
            for item in json_data:
                OfferProduct.objects.create(offer=created_offer, product_id=item['product_id'], product_quantity=item['quantity'],
                                            created_by=self.request.user)

        return super(EditOfferView, self).form_valid(form)

    def form_invalid(self, form):
        return super(EditOfferView, self).form_invalid(form)


class PublicOffersListView(ListView):
    template_name = 'barter_and_inventory/public_offers/list.html'
    queryset = Offer.objects.filter(offer_status__in=[Offer.OfferStatus.OPEN, Offer.OfferStatus.NEGOTIATION])
    paginate_by = 1
    context_object_name = 'offers'

    def get_queryset(self):
        queryset = Offer.objects.filter(offer_status__in=[Offer.OfferStatus.OPEN, Offer.OfferStatus.NEGOTIATION])
        category_val = self.request.GET.get('category', None)
        offer_status_val = self.request.GET.get('offer_status', None)
        order = self.request.GET.get('order_by', '-id')
        if category_val:
            queryset = queryset.filter(offered_products__product__product_categories__in=[category_val]).order_by(order)
        if offer_status_val:
            queryset = queryset.filter(offer_status=offer_status_val).order_by(order)

        if self.request.user.is_authenticated:
            queryset = queryset.exclude(created_by=self.request.user).annotate(already_placed_bid=Subquery(OfferBid.objects.filter(offer=OuterRef('pk'), created_by=self.request.user).values('bid_offer')[:1]))
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = self.request.GET.get('category', None)
        context['categories'] = Category.objects.all()
        context['offer_status'] = self.request.GET.get('offer_status', None)
        context['order_by'] = self.request.GET.get('order_by', '-id')
        return context


class AcceptBidView(FrontendUserViewMixin, PermissionRequiredMixin, FormView):
    permission_required = 'barter_and_inventory.change_offer'
    permission_denied_message = "You're not authorized to accept bid."
    template_name = 'barter_and_inventory/offers/detail.html'
    form_class = AcceptBidForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def form_valid(self, form):
        form.instance.updated_by = self.request.user
        form.instance.updated_at = datetime.datetime.now()
        offer = form.cleaned_data['offer']
        exchange_with = form.cleaned_data['exchanged_with']  # type: Offer
        try:
            offer_obj = Offer.objects.get(pk=offer, offer_status__in=[Offer.OfferStatus.NEGOTIATION, Offer.OfferStatus.OPEN],
                                          created_by=self.request.user)
        except Offer.DoesNotExist:
            form.add_error('offer', ValidationError("You've selected invalid offer.", "invalid_offer"))
            return self.form_invalid(form)
        bids_against_offer = OfferBid.objects.filter(bid_offer=exchange_with, offer=offer_obj).exists()
        if not bids_against_offer:
            form.add_error('exchanged_with', ValidationError("You've selected invalid bid to accept..", "invalid_bid"))
            return self.form_invalid(form)
        form.save()
        return HttpResponseRedirect(reverse_lazy('barter_and_inventory:view_offer_detail', kwargs={'pk': offer_obj.pk}))

    def form_invalid(self, form):
        return HttpResponseRedirect(reverse_lazy('barter_and_inventory:view_offer_detail', kwargs={'pk': form.cleaned_data.get('offer')}))


class WithdrawBidView(FrontendUserViewMixin, PermissionRequiredMixin, View):
    permission_required = 'barter_and_inventory.delete_offerbid'
    permission_denied_message = "You're not authorized to delete bid."

    def post(self, request, *args, **kwargs):
        bid_id = request.POST.get('bid_id')
        try:
            offer_bid_obj = OfferBid.objects.get(pk=bid_id, created_by=self.request.user)
            offer = offer_bid_obj.bid_offer
            offer_bid_obj.delete()
        except OfferBid.DoesNotExist:
            raise ValidationError("You've selected invalid bid to withdraw.", "invalid_bid")
        return HttpResponseRedirect(reverse_lazy('barter_and_inventory:view_offer_detail', kwargs={'pk': offer.pk}))


class IndexView(PublicOffersListView):
    template_name = 'barter_and_inventory/index.html'


class DeleteOfferView(FrontendUserViewMixin, PermissionRequiredMixin, DeleteView):
    permission_required = 'barter_and_inventory.delete_offer'
    permission_denied_message = "You're not authorized to delete offer."
    model = Offer
    success_url = reverse_lazy('barter_and_inventory:view_offers')
    template_name = 'barter_and_inventory/offers/delete.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user  # type: User
        return context

    def get_object(self, queryset=None):
        return get_object_or_404(self.model, pk=self.kwargs['pk'], offer_status__in=[Offer.OfferStatus.OPEN, Offer.OfferStatus.NEGOTIATION],
                                 created_by=self.request.user)
