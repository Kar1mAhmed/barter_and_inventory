# Generated by Django 3.2.8 on 2024-01-14 05:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('barter_and_inventory', '0008_alter_product_product_condition'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='product_condition',
            field=models.CharField(choices=[('NEW', 'New'), ('USED', 'Used'), ('BLANK', 'Blank')], default='BLANK', max_length=10),
        ),
    ]
