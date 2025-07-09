import '../../../../../config/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/pickers/custom_date_picker.dart';

import '../../../../../core/utils/utils.dart';
import '../bloc/reminder_bloc.dart';
import '../widgets/add_reminder_section.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({super.key});

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  final List<ReminderInstruction> _instruction = [];
  final List<ReminderSchedule> _manageSchedules = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _mealNameController = TextEditingController();
  final TextEditingController _mealNotesController = TextEditingController();

  final ValueNotifier<ReminderType> _reminderType =
      ValueNotifier(ReminderType.food);
  final ValueNotifier<ReminderInterval> _reminderInterval =
      ValueNotifier(ReminderInterval.daily);
  final ValueNotifier<ReminderNotificationSettings> _reminderNotification =
      ValueNotifier(ReminderNotificationSettings.fiveMins);
  final ValueNotifier<ReminderMealType> _mealType =
      ValueNotifier(ReminderMealType.breakfast);

  final ValueNotifier<DateTime?> _startDate = ValueNotifier(null);
  final ValueNotifier<DateTime?> _endDate = ValueNotifier(null);
  final ValueNotifier<TimeOfDay> _startReminderAt =
      ValueNotifier(TimeOfDay.now());
  final ValueNotifier<TimeOfDay> _endReminderAt =
      ValueNotifier(TimeOfDay.now());
  final ValueNotifier<TimeOfDay> _mealTime = ValueNotifier(TimeOfDay.now());

  void _createEventAndPop() {
    final bloc = context.read<ReminderBloc>();

    DateTime eventStartDate = _startDate.value!.add(
      Duration(
        hours: _startReminderAt.value.hour,
        minutes: _startReminderAt.value.minute,
      ),
    );

    DateTime eventEndDate = _endDate.value!.add(
      Duration(
        hours: _endReminderAt.value.hour,
        minutes: _endReminderAt.value.minute,
      ),
    );

    if (_manageSchedules.isNotEmpty || _instruction.isNotEmpty) {
      bloc.add(
        CreateReminderEvent(
          name: _nameController.text,
          dosage: _dosageController.text,
          type: _reminderType.value,
          interval: _reminderInterval.value,
          schedule: _manageSchedules,
          instruction: _instruction.first,
          startDate: eventStartDate.toIso8601String(),
          endDate: eventEndDate.toIso8601String(),
        ),
      );
      bloc.add(GetAllReminders());
      UtilHelpers.pop();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Add New Reminder",
          style: context.textTheme.headlineSmall?.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.manrope,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            children: [
              AddReminderSection(
                sectionName: "Reminder Type",
                subsection: Row(
                  children: [
                    for (ReminderType type in ReminderType.values)
                      ReminderTypeButton(type: type, notifier: _reminderType)
                  ],
                ),
              ),
              AnimatedCrossFade(
                duration: Durations.short4,
                firstChild: _DrugReminderDetails(
                  name: _nameController,
                  dosage: _dosageController,
                  intervalNotifier: _reminderInterval,
                  startDateNotifier: _startDate,
                  startTimeNotifier: _startReminderAt,
                  endDateNotifier: _endDate,
                  endTimeNotifier: _endReminderAt,
                  notificationNotifier: _reminderNotification,
                ),
                secondChild: _FoodReminderDetails(
                  notes: _mealNotesController,
                  mealName: _mealNameController,
                  mealType: _mealType,
                  mealTime: _mealTime,
                ),
                crossFadeState: switch (_reminderType.value) {
                  ReminderType.drug => CrossFadeState.showFirst,
                  ReminderType.food => CrossFadeState.showSecond
                },
              ),
              FilledButton(
                onPressed: _createEventAndPop,
                style: context.filledButtonTheme?.copyWith(
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: FontFamily.visbyRoundCF,
                    ),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                ),
                child: const Text("Set Reminder"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DrugReminderDetails extends StatelessWidget {
  const _DrugReminderDetails({
    required this.name,
    required this.dosage,
    required this.intervalNotifier,
    required this.notificationNotifier,
    required this.startDateNotifier,
    required this.startTimeNotifier,
    required this.endDateNotifier,
    required this.endTimeNotifier,
  });

  final TextEditingController name;
  final TextEditingController dosage;
  final ValueNotifier<ReminderInterval> intervalNotifier;
  final ValueNotifier<ReminderNotificationSettings> notificationNotifier;
  final ValueNotifier<DateTime?> startDateNotifier;
  final ValueNotifier<TimeOfDay> startTimeNotifier;
  final ValueNotifier<TimeOfDay> endTimeNotifier;
  final ValueNotifier<DateTime?> endDateNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        AddReminderSection(
          sectionName: "Name of Drug",
          subsection: TextField(
            controller: name,
            decoration: const InputDecoration(
              hintText: "Paracetamol",
            ),
          ),
        ),
        AddReminderSection(
          sectionName: "Dosage",
          subsection: TextField(
            controller: dosage,
            decoration: const InputDecoration(
              hintText: "500mg, 2 tablets, 10ml",
            ),
          ),
        ),
        AddReminderSection(
          sectionName: "Frequency (Daily)",
          subsection: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                  color: context.themeExtension.reminderInverseColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: ReminderDropDown<ReminderInterval>(
              items: ReminderInterval.values,
              notifier: intervalNotifier,
            ),
          ),
        ),
        AddReminderSection(
          sectionName: "Duration of Medication",
          subsection: Row(
            children: [
              CustomDatePicker(
                hint: "Start Date",
                dateListenable: startDateNotifier,
                timeListenable: startTimeNotifier,
              ),
              16.sizedBoxWidth,
              CustomDatePicker(
                hint: "End Date",
                dateListenable: endDateNotifier,
                timeListenable: endTimeNotifier,
              ),
            ],
          ),
        ),
        AddReminderSection(
          sectionName: "Frequency (Daily)",
          subsection: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                  color: context.themeExtension.reminderInverseColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: ReminderDropDown<ReminderInterval>(
              items: ReminderInterval.values,
              notifier: intervalNotifier,
            ),
          ),
        ),
        AddReminderSection(
          sectionName: "Notification Preferences",
          subsection: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.themeExtension.reminderInverseColor,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: ReminderDropDown<ReminderNotificationSettings>(
              items: ReminderNotificationSettings.values,
              notifier: notificationNotifier,
            ),
          ),
        ),
      ],
    );
  }
}

class _FoodReminderDetails extends StatelessWidget {
  const _FoodReminderDetails({
    required this.notes,
    required this.mealName,
    required this.mealType,
    required this.mealTime,
  });

  final TextEditingController mealName;
  final TextEditingController notes;
  final ValueNotifier<TimeOfDay> mealTime;
  final ValueNotifier<ReminderMealType> mealType;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        AddReminderSection(
          sectionName: "Meal Type",
          subsection: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                  color: context.themeExtension.reminderInverseColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: ReminderDropDown<ReminderMealType>(
              items: ReminderMealType.values,
              notifier: mealType,
            ),
          ),
        ),
        AddReminderSection(
          sectionName: "Name of Meal",
          subsection: TextField(
            controller: mealName,
            decoration: const InputDecoration(
              hintText: "Amala with Gbegiri and Ewedu",
            ),
          ),
        ),
        AddReminderSection(
          sectionName: "Time",
          subsection: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: context.themeExtension.reminderInverseColor,
              ),
            ),
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("data"),
                  Icon(Icons.lock_clock_outlined),
                ],
              ),
            ),
          ),
        ),
        AddReminderSection(
          sectionName: "Dietary Notes (optional)",
          subsection: TextField(
            maxLines: 3,
            controller: notes,
            decoration: const InputDecoration(
              hintText: "Low-carb meal preferred. Avoid dairy.",
            ),
          ),
        ),
        20.sizedBoxHeight
      ],
    );
  }
}
