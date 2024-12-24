# Generated by Django 4.2 on 2024-12-20 01:30

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_healthmetricthreshold_userhealthmetrics'),
    ]

    operations = [
        migrations.CreateModel(
            name='Reminder',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(choices=[('food', 'Food'), ('drug', 'Drug'), ('appointment', 'Appointment')], max_length=20)),
                ('title', models.CharField(max_length=255)),
                ('description', models.TextField(blank=True, null=True)),
                ('reminder_time', models.DateTimeField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reminders', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='FoodReminder',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('meal_type', models.CharField(choices=[('breakfast', 'Breakfast'), ('lunch', 'Lunch'), ('dinner', 'Dinner')], max_length=50)),
                ('calories', models.PositiveIntegerField(blank=True, null=True)),
                ('reminder', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='food_details', to='api.reminder')),
            ],
        ),
        migrations.CreateModel(
            name='DrugReminder',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('medication_name', models.CharField(max_length=255)),
                ('dosage', models.CharField(max_length=100)),
                ('frequency', models.CharField(max_length=100)),
                ('reminder', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='drug_details', to='api.reminder')),
            ],
        ),
        migrations.CreateModel(
            name='AppointmentReminder',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('location', models.CharField(max_length=255)),
                ('doctor_name', models.CharField(max_length=255)),
                ('notes', models.TextField(blank=True, null=True)),
                ('reminder', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='appointment_details', to='api.reminder')),
            ],
        ),
    ]
