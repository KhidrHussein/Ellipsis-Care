part of 'reminder_bloc.dart';

sealed class ReminderEvent {}

class EditReminder implements ReminderEvent {}

class SelectDate implements ReminderEvent {
  SelectDate({required this.newDate});

  final DateTime newDate;
}

class CreateReminder implements ReminderEvent {
  CreateReminder({
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
  final List<ReminderSchedule> schedule;
  final ReminderInstruction instruction;
  final DateTime? startDate;
  final DateTime? endDate;
}
