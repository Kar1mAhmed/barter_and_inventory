# Generated by Django 3.2.8 on 2024-01-14 05:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('barter_and_inventory', '0006_otp'),
    ]

    operations = [
        migrations.AlterField(
            model_name='offer',
            name='cash_in_hand_currency',
            field=models.CharField(blank=True, choices=[('PKR', 'Pakistani Rupees'), ('INR', 'Indian Rupees'), ('EUR', 'Euros'), ('USD', 'United Stated Dollar'), ('CAD', 'Canadian Dollar'), ('GBP', 'British Pound'), ('JPY', 'Japanese Yen'), ('CHF', 'Swiss Franc')], default='CAD', max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='product',
            name='price_currency',
            field=models.CharField(choices=[('PKR', 'Pakistani Rupees'), ('INR', 'Indian Rupees'), ('EUR', 'Euros'), ('USD', 'United Stated Dollar'), ('CAD', 'Canadian Dollar'), ('GBP', 'British Pound'), ('JPY', 'Japanese Yen'), ('CHF', 'Swiss Franc')], default='CAD', max_length=255),
        ),
        migrations.AlterField(
            model_name='product',
            name='product_condition',
            field=models.CharField(choices=[('NEW', 'New'), ('USED', 'Used')], default=None, max_length=10),
        ),
    ]