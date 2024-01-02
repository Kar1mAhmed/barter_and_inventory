# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : mixins
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 14/10/2021 3:41 AM
# @Desc   :
# '''=================================================
from django.contrib.auth.mixins import LoginRequiredMixin, AccessMixin
from django.contrib.auth.views import redirect_to_login
from django.core.exceptions import PermissionDenied


class FrontendUserViewMixin(LoginRequiredMixin):
    permission_denied_message = "You're not authorized to view the request resource."
    redirect_field_name = 'redirect_to'
    login_url = '/'

    def dispatch(self, request, *args, **kwargs):
        if request.user.groups.filter(name='frontend_user').exists():
            return super().dispatch(request, *args, **kwargs)
        return redirect_to_login(request.get_full_path(), self.get_login_url(), self.get_redirect_field_name())
