// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/utils/enums/reminder.dart';

class ReminderModel {
  final String name;
  final String dosage;
  final bool eventIsCompleted;
  final ReminderType type;
  final ReminderInterval interval;
  final ReminderInstruction instruction;
  final List<ReminderSchedule> schedule;

  final DateTime startDate;
  final DateTime endDate;

  ReminderModel({
    required this.name,
    required this.dosage,
    required this.eventIsCompleted,
    required this.type,
    required this.interval,
    required this.instruction,
    required this.schedule,
    required this.startDate,
    required this.endDate,
  });

  ReminderModel copyWith({
    String? name,
    String? dosage,
    bool? eventIsCompleted,
    ReminderType? type,
    ReminderInterval? interval,
    ReminderInstruction? instruction,
    List<ReminderSchedule>? schedule,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return ReminderModel(
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      eventIsCompleted: eventIsCompleted ?? this.eventIsCompleted,
      type: type ?? this.type,
      interval: interval ?? this.interval,
      instruction: instruction ?? this.instruction,
      schedule: schedule ?? this.schedule,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  String toString() {
    return 'ReminderModel(name: $name, dosage: $dosage, eventIsCompleted: $eventIsCompleted, type: $type, schedule: $schedule, interval: $interval, startDate: $startDate, endDate: $endDate)';
  }
}
