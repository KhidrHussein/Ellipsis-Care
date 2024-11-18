// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  final TimeOfDay reminderStartTime;
  final TimeOfDay reminderEndTime;
  
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
    required this.reminderStartTime,
    required this.reminderEndTime,
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
    TimeOfDay? reminderStartTime,
    TimeOfDay? reminderEndTime,
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
      reminderStartTime: reminderStartTime ?? this.reminderStartTime,
      reminderEndTime: reminderEndTime ?? this.reminderEndTime,
    );
  }

  @override
  String toString() {
    return 'ReminderModel(name: $name, dosage: $dosage, eventIsCompleted: $eventIsCompleted, type: $type, schedule: $schedule, interval: $interval, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant ReminderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.dosage == dosage &&
      other.eventIsCompleted == eventIsCompleted &&
      other.type == type &&
      other.interval == interval &&
      other.instruction == instruction &&
      listEquals(other.schedule, schedule) &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.reminderStartTime == reminderStartTime &&
      other.reminderEndTime == reminderEndTime;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      dosage.hashCode ^
      eventIsCompleted.hashCode ^
      type.hashCode ^
      interval.hashCode ^
      instruction.hashCode ^
      schedule.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      reminderStartTime.hashCode ^
      reminderEndTime.hashCode;
  }
}
