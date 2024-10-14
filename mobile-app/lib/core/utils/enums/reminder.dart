import '../../constants/asset_strings.dart';
import 'package:flutter/widgets.dart';

import '../../constants/colors.dart';

enum ReminderInterval {
  daily(intervalName: "Daily"),
  twice(intervalName: "Twice"),
  thrice(intervalName: "Thrice");

  const ReminderInterval({required this.intervalName});
  final String intervalName;
}

enum ReminderSchedule {
  morning(scheduleName: "Morning"),
  afternoon(scheduleName: "Afternoon"),
  evening(scheduleName: "Evening");

  const ReminderSchedule({required this.scheduleName});
  final String scheduleName;
}

enum ReminderInstruction {
  beforeMeal(instructionName: "Before Meal"),
  afterMeal(instructionName: "After Meal");

  const ReminderInstruction({required this.instructionName});
  final String instructionName;
}

enum ReminderType {
  food(
    name: "Food",
    icon: AssetStrings.food,
    borderColor: AppColors.foodReminderBorderColor,
    backgroundColor: AppColors.foodReminderColor,
  ),
  drug(
    name: "Drug",
    icon: AssetStrings.drug,
    backgroundColor: AppColors.drugReminderColor,
    borderColor: AppColors.drugReminderBorderColor,
  );

  const ReminderType({
    required this.name,
    required this.icon,
    required this.borderColor,
    required this.backgroundColor,
  });

  final String name;
  final String icon;
  final Color backgroundColor;
  final Color borderColor;
}
