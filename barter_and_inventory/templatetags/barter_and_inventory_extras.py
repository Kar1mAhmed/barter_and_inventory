# -*- coding: UTF-8 -*-
# '''=================================================
# @Project: barter_and_inventory_project
# @File   : barter_and_inventory_extras
# @IDE    : PyCharm
# @Author : Muhammad Arshad
# @Email  : arshad@hexasoft.io
# @Time   : 13/10/2021 4:03 PM
# @Desc   :
# '''=================================================

from django import template
register = template.Library()


class ModelsPermissionListNode(template.Node):
    def __init__(self, permission_queryset):
        self.permission_queryset = template.Variable(permission_queryset)

    def render(self, context):
        try:
            actual_queryset = self.permission_queryset.resolve(context)
            permissions_models = set(actual_queryset.values_list('content_type__model', flat=True))
            models_permission_list = dict()
            for item in permissions_models:
                models_permission_list[item] = list(actual_queryset.filter(content_type__model=item).values_list('codename', flat=True))
            context['models_with_permission_list'] = models_permission_list
        except template.VariableDoesNotExist:
            return ''
        return ''


@register.tag(name='get_models_with_permissions')
def do_models_with_permissions(parser, token):
    try:
        # split_contents() knows not to split quoted strings.
        tag_name, permission_queryset = token.split_contents()
    except ValueError:
        raise template.TemplateSyntaxError(
            "%r tag requires a single argument" % token.contents.split()[0]
        )
    return ModelsPermissionListNode(permission_queryset)


@register.filter
def get_type(value):
    return type(value)


@register.filter('startswith')
def startswith(text, starts):
    if isinstance(text, str):
        return text.startswith(starts)
    return False


@register.filter
def replace(value, arg):
    if len(arg.split('|')) != 2:
        return value
    what, to = arg.split('|')
    return value.replace(what, to)


@register.simple_tag(takes_context=True)
def url_replace(context, **kwargs):
    query = context['request'].GET.copy()
    query.update(kwargs)
    return query.urlencode()