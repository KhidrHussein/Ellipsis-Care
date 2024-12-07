# Generated by Django 5.1 on 2024-11-17 05:50

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0006_alter_customuser_username'),
    ]

    operations = [
        migrations.CreateModel(
            name='HealthSyncScore',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(auto_now_add=True)),
                ('daily_score', models.FloatField()),
                ('cumulative_monthly_score', models.FloatField()),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
