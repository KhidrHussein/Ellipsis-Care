// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/enums/reminder_options/reminder_options.dart';

part 'reminder_model.g.dart';

@HiveType(typeId: 3)
class ReminderModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String dosage;

  @HiveField(2)
  final bool markAsCompleted;

  @HiveField(3)
  final ReminderType type;

  @HiveField(4)
  final ReminderInterval interval;

  @HiveField(5)
  final ReminderInstruction instruction;

  @HiveField(6)
  final List<ReminderSchedule> schedule;

  @HiveField(7)
  final String startDate;

  @HiveField(8)
  final String endDate;

  @HiveField(9)
  final String createdAt;

  @HiveField(10)
  final String? updatedAt;

  @HiveField(11)
  final String id;

  ReminderModel({
    required this.name,
    required this.dosage,
    required this.type,
    required this.interval,
    required this.instruction,
    required this.schedule,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.id,
    this.markAsCompleted = false,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'ReminderModel(name: $name, dosage: $dosage, markAsCompleted: $markAsCompleted, type: $type, interval: $interval, instruction: $instruction, schedule: $schedule, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }

  ReminderModel copyWith({
    String? name,
    String? dosage,
    bool? markAsCompleted,
    ReminderType? type,
    ReminderInterval? interval,
    ReminderInstruction? instruction,
    List<ReminderSchedule>? schedule,
    String? startDate,
    String? endDate,
    String? createdAt,
    String? updatedAt,
    String? id,
  }) {
    return ReminderModel(
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      markAsCompleted: markAsCompleted ?? this.markAsCompleted,
      type: type ?? this.type,
      interval: interval ?? this.interval,
      instruction: instruction ?? this.instruction,
      schedule: schedule ?? this.schedule,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
    );
  }
}
