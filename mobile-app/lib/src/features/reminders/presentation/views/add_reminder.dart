import '../../../../../config/gen/assets.gen.dart';
import '../../../../../config/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/pickers/check_type_picker.dart';
import '../widgets/pickers/custom_date_picker.dart';
import '../widgets/pickers/radio_type_picker.dart';

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

  final ValueNotifier<ReminderType> _reminderType =
      ValueNotifier(ReminderType.food);
  final ValueNotifier<ReminderInterval> _reminderInterval =
      ValueNotifier(ReminderInterval.daily);
  final ValueNotifier<DateTime?> _startDate = ValueNotifier(null);
  final ValueNotifier<DateTime?> _endDate = ValueNotifier(null);
  final ValueNotifier<TimeOfDay> _startReminderAt =
      ValueNotifier(TimeOfDay.now());
  final ValueNotifier<TimeOfDay> _endReminderAt =
      ValueNotifier(TimeOfDay.now());

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
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 12, vertical: 20),
      margin: REdgeInsets.symmetric(horizontal: 16, vertical: .08.sh),
      decoration: BoxDecoration(
        color: context.themeExtension.reminderColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Add New Reminder",
            style: context.textTheme.headlineMedium?.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.visbyRoundCF,
            ),
          ),
          10.sizedBoxHeight,
          AddReminderSection(
            sectionName: "Name",
            subsection: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Input the name of the reminder",
              ),
            ),
          ),
          AddReminderSection(
            sectionName: "Type",
            subsection: Row(
              children: ReminderType.values
                  .map(
                    (reminderType) => ValueListenableBuilder(
                      valueListenable: _reminderType,
                      builder: (context, value, child) =>
                          _buildReminderTypeButton(reminderType, value),
                    ),
                  )
                  .toList(),
            ),
          ),
          AddReminderSection(
            sectionName: "Schedule",
            subsection: Row(
              children: ReminderSchedule.values
                  .map(
                    (schedule) => CheckTypePicker(
                      scheduleType: schedule,
                      schedules: _manageSchedules,
                      option: schedule.scheduleName,
                    ),
                  )
                  .toList(),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: AddReminderSection(
                  sectionName: "Interval (Daily)",
                  subsection: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: context.themeExtension.reminderInverseColor),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: _reminderInterval,
                      builder: (context, value, child) =>
                          _buildDropDownButton(value),
                    ),
                  ),
                ),
              ),
              16.sizedBoxWidth,
              Expanded(
                child: AddReminderSection(
                  sectionName: "Dose (Daily)",
                  subsection: TextField(
                    controller: _dosageController,
                    decoration:
                        const InputDecoration(hintText: "1 Tablet, 100 ml"),
                  ),
                ),
              ),
            ],
          ),
          AddReminderSection(
            sectionName: "Duration",
            subsection: Row(
              children: [
                CustomDatePicker(
                  hint: "Start Date",
                  dateListenable: _startDate,
                  timeListenable: _startReminderAt,
                ),
                16.sizedBoxWidth,
                CustomDatePicker(
                  hint: "End Date",
                  dateListenable: _endDate,
                  timeListenable: _endReminderAt,
                ),
              ],
            ),
          ),
          AddReminderSection(
            sectionName: "Instruction",
            subsection: Row(
              children: ReminderInstruction.values.map(
                (instruction) {
                  return RadioTypePicker<ReminderInstruction>(
                    value: instruction,
                    option: instruction.instructionName,
                    onInstructionSelected: (value) {
                      if (value != null) {
                        if (!_instruction.contains(value)) {
                          _instruction.add(value);
                        } else {
                          _instruction.remove(value);
                        }
                      }
                    },
                  );
                },
              ).toList(),
            ),
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
            child: const Text("Add Reminder"),
          )
        ],
      ),
    );
  }

  Widget _buildReminderTypeButton(
      ReminderType reminderType, ReminderType currentType) {
    return GestureDetector(
      onTap: () => _reminderType.value = reminderType,
      child: AnimatedContainer(
        duration: Durations.medium2,
        margin: REdgeInsets.only(right: 10),
        padding: REdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: switch (reminderType) {
            ReminderType.drug => context.themeExtension.drugBgColor,
            ReminderType.food => context.themeExtension.foodBgColor,
          },
          borderRadius: BorderRadius.circular(5.r),
          border: currentType == reminderType
              ? Border.all(color: context.themeExtension.reminderInverseColor)
              : null,
        ),
        child: Column(
          children: [
            switch (reminderType) {
              ReminderType.drug => AppAssets.icons.icDrug.svg(
                  width: 32,
                  colorFilter: ColorFilter.mode(
                    context.themeExtension.drugColor,
                    BlendMode.srcIn,
                  ),
                ),
              ReminderType.food => AppAssets.icons.icFood.svg(
                  width: 32,
                  colorFilter: ColorFilter.mode(
                    context.themeExtension.foodColor,
                    BlendMode.srcIn,
                  ),
                ),
            },
            10.sizedBoxHeight,
            Text(
              reminderType.name,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                color: context.themeExtension.reminderInverseColor
                    .withValues(alpha: .3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropDownButton(ReminderInterval? value) {
    return DropdownButton<ReminderInterval>(
      elevation: 4,
      menuWidth: 84.w,
      isExpanded: true,
      borderRadius: BorderRadius.circular(5.r),
      padding: REdgeInsets.only(left: 12),
      style: context.textTheme.labelSmall?.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: context.textTheme.labelSmall?.color!.withValues(alpha: .87),
      ),
      underline: const SizedBox(),
      hint: Text(
        "Daily, twice, etc",
        style: context.textTheme.labelSmall?.copyWith(
          fontSize: 14.sp,
          color: context.textTheme.labelSmall?.color!.withValues(alpha: .3),
        ),
      ),
      value: value,
      items: ReminderInterval.values
          .map(
            (interval) => DropdownMenuItem<ReminderInterval>(
              value: interval,
              child: Text(interval.intervalName),
            ),
          )
          .toList(),
      onChanged: (value) => _reminderInterval.value = value!,
    );
  }
}
