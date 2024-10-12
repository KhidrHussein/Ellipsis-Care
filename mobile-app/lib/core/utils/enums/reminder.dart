import '../../constants/asset_strings.dart';
import 'package:flutter/widgets.dart';

import '../../constants/colors.dart';

enum ReminderInterval { daily, twice, thrice }

enum ReminderSchedule { morning, afternoon, evening }

enum ReminderInstruction { beforeMeal, afterMeal }

enum ReminderType {
  food(
    name: "Food",
    icon: AssetStrings.food,
    isPicked: false,
    borderColor: AppColors.foodReminderBorderColor,
    backgroundColor: AppColors.foodReminderColor,
  ),
  drug(
    name: "Drug",
    isPicked: false,
    icon: AssetStrings.drug,
    backgroundColor: AppColors.drugReminderColor,
    borderColor: AppColors.drugReminderBorderColor,
  );

  const ReminderType({
    required this.name,
    required this.icon,
    required this.isPicked,
    required this.borderColor,
    required this.backgroundColor,
  });

  final String name;
  final String icon;
  final bool isPicked;
  final Color backgroundColor;
  final Color borderColor;
}
