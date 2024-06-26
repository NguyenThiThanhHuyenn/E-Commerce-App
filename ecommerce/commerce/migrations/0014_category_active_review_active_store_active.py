# Generated by Django 5.0.4 on 2024-04-16 17:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commerce', '0013_remove_product_image_productimage_product_images'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='active',
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name='review',
            name='active',
            field=models.BooleanField(default=True),
        ),
        migrations.AddField(
            model_name='store',
            name='active',
            field=models.BooleanField(default=True),
        ),
    ]
