import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/colors.dart';

part 'enums.g.dart';

enum ApiState {
  loading,
  success,
  failed,
  none,
}

enum InAppNavigationRoutes {
  home,
  reminders,
  emergency,
  dashboard,
  settings,
}

enum MicrophoneState {
  recording,
  paused,
  resumed,
  stopped,
  none,
}

enum FileStorageType {
  prompt,
  notification,
  recording,
}

enum DateRange {
  day,
  week,
  month,
  year,
}

enum Status {
  positive("Positive", Color(0xFF56C568)),
  informational("Informational", Color(0xFF3FA2F7)),
  negative("Negative", Color(0xFFEB5757)),
  warning("Warning", Color(0xFFFFC400)),
  inactive("Inactive", Color(0xFFD4D4D4), AppColors.darkGrey);

  const Status(this.statusName, this.statusColor,
      [this.labelColor = AppColors.white]);
  final String statusName;
  final Color labelColor;
  final Color statusColor;
}

enum HealthOptions {
  weight(name: "Weight", unitsOfMeasurement: ["Kg", "Tonnes", "Pounds"]),
  bloodPressure(name: "Blood Pressure", unitsOfMeasurement: ["mmHg"]),
  waterContent(name: "Water/Blood Content", unitsOfMeasurement: ["Kg"]);

  const HealthOptions({required this.name, required this.unitsOfMeasurement});
  final String name;
  final List<String> unitsOfMeasurement;
}

enum SyncScore {
  optimal(
    text: "90% - 100% - Optimal Sync",
    bgColor: AppColors.optimalScoreBgColor,
    scoreColor: AppColors.optimalScoreColor,
  ),
  strong(
    text: "80% - 89% - Strong Sync",
    bgColor: AppColors.strongScoreBgColor,
    scoreColor: AppColors.strongScoreColor,
  ),
  moderate(
    text: "70% - 79% - Moderate Sync",
    bgColor: AppColors.moderateScoreBgColor,
    scoreColor: AppColors.moderateScoreColor,
  ),
  weak(
    text: "50% - 69% - Weak Sync",
    bgColor: AppColors.weakScoreBgColor,
    scoreColor: AppColors.weakScoreColor,
  ),
  outOfSync(
    text: "Below 50% - Out of Sync",
    bgColor: AppColors.outScoreBgColor,
    scoreColor: AppColors.outScoreColor,
  );

  const SyncScore({
    required this.text,
    required this.scoreColor,
    required this.bgColor,
  });
  final String text;
  final Color scoreColor;
  final Color bgColor;
}

enum ReminderNotificationSettings {
  whenReminderStarts,
  fiveMins,
  tenMins,
  fifteenMins,
  thirtyMins,
  oneHour;
}

enum ReminderMealType { breakfast, lunch, dinner, snack }

@HiveType(typeId: 4)
enum ReminderInterval {
  @HiveField(0)
  daily(intervalName: "Daily"),
  @HiveField(1)
  twice(intervalName: "Twice"),
  @HiveField(2)
  thrice(intervalName: "Thrice");

  const ReminderInterval({required this.intervalName});
  final String intervalName;
}

@HiveType(typeId: 5)
enum ReminderSchedule {
  @HiveField(0)
  morning(scheduleName: "Morning"),
  @HiveField(1)
  afternoon(scheduleName: "Afternoon"),
  @HiveField(2)
  evening(scheduleName: "Evening");

  const ReminderSchedule({required this.scheduleName});
  final String scheduleName;
}

@HiveType(typeId: 6)
enum ReminderInstruction {
  @HiveField(0)
  beforeMeal(instructionName: "Before Meal"),
  @HiveField(1)
  afterMeal(instructionName: "After Meal");

  const ReminderInstruction({required this.instructionName});
  final String instructionName;
}

@HiveType(typeId: 7)
enum ReminderType {
  @HiveField(0)
  food(name: "Food"),
  @HiveField(1)
  drug(name: "Drug");

  const ReminderType({required this.name});
  final String name;
}
