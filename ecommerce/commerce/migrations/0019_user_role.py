# Generated by Django 5.0.4 on 2024-04-19 02:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commerce', '0018_remove_user_role'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='role',
            field=models.CharField(choices=[('seller', 'Seller'), ('customer', 'Customer')], default='customer', max_length=20),
        ),
    ]
