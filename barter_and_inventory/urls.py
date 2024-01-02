# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : urls.py
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 11/10/2021 11:55 PM
# @Desc   :
# '''=================================================

from django.urls import path
from . import views
from django.conf.urls.static import static 
from django.conf import settings


urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    path('login', views.BarterLoginView.as_view(redirect_authenticated_user=True), name='login'),
    path('signup', views.SignupView.as_view(), name='signup'),
    path('logout', views.LogoutView.as_view(), name="logout"),
    path('dashboard', views.DashboardView.as_view(), name="dashboard"),
    path('account_activation_sent', views.AccountActivationSentView.as_view(), name="account_activation_sent"),
    path('activate/<uidb64>/<token>/', views.ActivateView.as_view(), name="activate"),
    path('reset-password', views.PasswordResetRequestView.as_view(), name='reset_password'),
    path('reset-password/done/', views.PasswordResetRequestSentView.as_view(), name='reset_password_request_sent'),
    path('reset/<uidb64>/<token>/', views.PasswordResetConfirm.as_view(), name='reset_password_confirm'),
    path('reset/done/', views.PasswordResetComplete.as_view(), name='reset_password_complete'),
    path('products/', views.ProductsListView.as_view(), name='view_products'),
    path('product/add', views.AddProductView.as_view(), name='add_product'),
    path('product/change/<pk>', views.EditProductView.as_view(), name='edit_product'),
    path('product/detail/<pk>', views.ProductDetailView.as_view(), name='view_product_detail'),
    path('product-photo/delete/<pk>', views.DeleteProductPhotoView.as_view(), name='delete_product_photo'),
    path('product/delete/<pk>', views.DeleteProductView.as_view(), name='delete_product'),
    path('profile/', views.ProfileDetailView.as_view(), name='view_profile'),
    path('profile/edit/', views.EditProfileView.as_view(), name='edit_profile'),
    path('settings/', views.SettingPasswordChangeView.as_view(), name='change_password'),
    path('offers/', views.OffersListView.as_view(), name='view_offers'),
    path('exchangeable-offers/<int:bid_against_offer>', views.ExchangeableOffersListView.as_view(), name='view_exchangeable_offers'),
    path('offer/add', views.AddOfferView.as_view(), name='add_offer'),
    path('offer/change/<pk>', views.EditProductView.as_view(), name='edit_offer'),
    path('offer/detail/<pk>', views.OfferDetailView.as_view(), name='view_offer_detail'),
    path('offer-product/delete/<pk>', views.DeleteProductPhotoView.as_view(), name='delete_offer_product'),
    path('offer/delete/<pk>', views.DeleteOfferView.as_view(), name='delete_offer'),
    path('public-offers/', views.PublicOffersListView.as_view(), name='public_offers'),
    path('accept-offer/', views.AcceptBidView.as_view(), name='accept_offer'),
    path('widthraw-bid/', views.WithdrawBidView.as_view(), name='withdraw_bid'),

]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)