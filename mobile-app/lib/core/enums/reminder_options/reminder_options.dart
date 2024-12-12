import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/asset_strings.dart';

part 'reminder_options.g.dart';

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
  food(name: "Food", icon: AssetStrings.foodIcon),

  @HiveField(1)
  drug(name: "Drug", icon: AssetStrings.drugIcon);

  const ReminderType({required this.name, required this.icon});
  final String name;
  final String icon;
}
