# Generated by Django 5.0.4 on 2024-04-25 14:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commerce', '0019_user_role'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='image',
            field=models.ImageField(default=None, upload_to='categoryImage/%Y/%m'),
        ),
    ]
