# Generated by Django 5.0.4 on 2024-04-16 18:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('commerce', '0014_category_active_review_active_store_active'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='images',
        ),
    ]
