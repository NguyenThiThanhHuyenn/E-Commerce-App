# Generated by Django 5.0.4 on 2024-04-16 15:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commerce', '0011_remove_store_wallpaper'),
    ]

    operations = [
        migrations.AddField(
            model_name='store',
            name='wallpaper',
            field=models.ImageField(default=None, upload_to='wallpaper/%Y/%m'),
        ),
    ]