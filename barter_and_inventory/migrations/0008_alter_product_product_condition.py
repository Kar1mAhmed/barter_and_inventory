# Generated by Django 3.2.8 on 2024-01-14 05:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('barter_and_inventory', '0007_auto_20240114_0744'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='product_condition',
            field=models.CharField(blank=True, choices=[('NEW', 'New'), ('USED', 'Used')], default=None, max_length=10),
        ),
    ]