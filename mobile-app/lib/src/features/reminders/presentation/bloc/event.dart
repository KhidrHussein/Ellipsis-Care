part of 'bloc.dart';

sealed class ReminderEvent {}

class FetchRemindersFromStorage implements ReminderEvent {}

class AddReminder implements ReminderEvent {
  AddReminder({
    required this.name,
    required this.dose,
    required this.type,
    required this.frequencyInterval,
    required this.instruction,
    required this.startDate,
    required this.endDate,
  });

  final String name;
  final String dose;
  final ReminderType type;
  final ReminderInterval frequencyInterval;
  final ReminderInstruction instruction;
  final DateTime startDate;
  final DateTime endDate;
}
