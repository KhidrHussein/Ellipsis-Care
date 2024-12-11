import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/extensions.dart';

import '../../../../../../core/constants/colors.dart';

class TimePicker extends StatefulWidget {
  final void Function(TimeOfDay) onTimePicked;
  const TimePicker({super.key, required this.onTimePicked});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final ValueNotifier<bool> _dayPeriodIsAM = ValueNotifier(false);
  final ValueNotifier<TimeOfDay> _currentTime = ValueNotifier(TimeOfDay.now());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            _currentTime.value = time ?? TimeOfDay.now();

            if (_currentTime.value.period == DayPeriod.am) {
              _dayPeriodIsAM.value = true;
            }

            widget.onTimePicked(_currentTime.value);
          },
          child: Container(
            padding: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.timePickerBgColor,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: ValueListenableBuilder(
              valueListenable: _currentTime,
              builder: (context, value, _) {
                final localizations = MaterialLocalizations.of(context);
                return Text(
                  localizations.formatTimeOfDay(value),
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w400),
                );
              },
            ),
          ),
        ),
        8.horizontalSpace,
        Container(
          padding: REdgeInsets.all(3),
          decoration: BoxDecoration(
            color: AppColors.timePickerBgColor,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: ValueListenableBuilder(
              valueListenable: _dayPeriodIsAM,
              builder: (context, value, child) {
                return Row(
                  children: [
                    _build12hFormat(schedule: "AM", dayPeriod: value),
                    _build12hFormat(schedule: "PM", dayPeriod: !value)
                  ],
                );
              }),
        )
      ],
    );
  }

  Widget _build12hFormat({required String schedule, required bool dayPeriod}) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: switch (dayPeriod) {
        true => BoxDecoration(
            color: context.themeExtension.reminderColor,
            borderRadius: BorderRadius.circular(6.r),
          ),
        false => null
      },
      child: Text(
        schedule,
        style:
            context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
