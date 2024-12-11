part of 'reminder_bloc.dart';

sealed class ReminderEvent {}

class GetAllReminders implements ReminderEvent {}

class InitializeVoiceCommandEvent implements ReminderEvent {}

class ActivateVoiceCommandEvent implements ReminderEvent {}

class UpdateCurrentDateEvent implements ReminderEvent {
  UpdateCurrentDateEvent({required this.newDate});

  final DateTime newDate;
}

class EditReminderEvent implements ReminderEvent {
  EditReminderEvent({required this.reminder});

  final ReminderModel reminder;
}

class CreateReminderEvent implements ReminderEvent {
  CreateReminderEvent({
    required this.name,
    required this.dosage,
    required this.type,
    required this.interval,
    required this.schedule,
    required this.instruction,
    required this.startDate,
    required this.endDate,
  });

  final String name;
  final String dosage;
  final ReminderType type;
  final ReminderInterval interval;
  final ReminderInstruction instruction;
  final List<ReminderSchedule> schedule;
  final String startDate;
  final String endDate;
  final String createdAt = DateTime.now().toIso8601String();
}
