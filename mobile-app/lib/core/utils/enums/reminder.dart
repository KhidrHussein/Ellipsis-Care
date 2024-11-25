import '../../constants/asset_strings.dart';

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
  food(name: "Food", icon: AssetStrings.foodIcon),
  drug(name: "Drug", icon: AssetStrings.drugIcon);

  const ReminderType({required this.name, required this.icon});

  final String name;
  final String icon;
}
