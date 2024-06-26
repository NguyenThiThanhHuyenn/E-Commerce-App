# Generated by Django 5.0.4 on 2024-05-08 10:46

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commerce', '0036_cart'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='grouporderbystore',
            name='order',
        ),
        migrations.RemoveField(
            model_name='grouporderbystore',
            name='store',
        ),
        migrations.RemoveField(
            model_name='orderdetail',
            name='group_order',
        ),
        migrations.AddField(
            model_name='orderdetail',
            name='order',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='commerce.order'),
        ),
        migrations.AlterField(
            model_name='payment',
            name='payment_method',
            field=models.CharField(max_length=20),
        ),
        migrations.DeleteModel(
            name='Cart',
        ),
        migrations.DeleteModel(
            name='GroupOrderByStore',
        ),
    ]
