# Generated by Django 5.0.4 on 2024-05-07 13:46

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('commerce', '0030_remove_order_store_orderdetail_store'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='orderdetail',
            name='order',
        ),
        migrations.RemoveField(
            model_name='orderdetail',
            name='store',
        ),
        migrations.CreateModel(
            name='GroupOrderByStore',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total_amount_by_store', models.DecimalField(decimal_places=2, max_digits=10)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='commerce.order')),
                ('store', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='commerce.store')),
            ],
        ),
        migrations.AddField(
            model_name='orderdetail',
            name='group_order',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='commerce.grouporderbystore'),
        ),
    ]
