part of 'reminder_bloc.dart';

sealed class ReminderEvent {}

class EditReminderEvent implements ReminderEvent {}

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
    required this.eventDate,
  });

  final String name;
  final String dosage;
  final ReminderType type;
  final ReminderInterval interval;
  final List<ReminderSchedule> schedule;
  final ReminderInstruction instruction;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime eventDate;
}
