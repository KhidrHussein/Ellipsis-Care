part of 'reminder_bloc.dart';

sealed class ReminderEvent {}

class InitializeVoiceCommandEvent implements ReminderEvent {}

class ActivateVoiceCommandEvent implements ReminderEvent {}

class UpdateCurrentDateEvent implements ReminderEvent {
  UpdateCurrentDateEvent({required this.newDate});

  final DateTime newDate;
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
    required this.eventStartTime,
    required this.eventEndTime,
  });

  final String name;
  final String dosage;
  final ReminderType type;
  final ReminderInterval interval;
  final List<ReminderSchedule> schedule;
  final ReminderInstruction instruction;
  final DateTime? startDate;
  final DateTime? endDate;
  final TimeOfDay? eventStartTime;
  final TimeOfDay? eventEndTime;
}
