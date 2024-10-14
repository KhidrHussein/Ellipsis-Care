import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/enums/reminder.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';

class CheckTypePicker extends StatefulWidget {
  final String option;
  final ReminderSchedule scheduleType;
  final List<ReminderSchedule> schedules;

  const CheckTypePicker({
    super.key,
    required this.option,
    required this.scheduleType,
    required this.schedules,
  });

  @override
  State<CheckTypePicker> createState() => _CheckTypePickerState();
}

class _CheckTypePickerState extends State<CheckTypePicker> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox.fromSize(
            size: const Size.square(26),
            child: Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() => _isChecked = value!);
                if (_isChecked) {
                  if (!widget.schedules.contains(widget.scheduleType)) {
                    widget.schedules.add(widget.scheduleType);
                  }
                } else {
                  widget.schedules.remove(widget.scheduleType);
                }
              },
            ),
          ),
          2.sizedBoxWidth,
          Text(
            widget.option,
            style: context.textTheme.labelLarge?.copyWith(fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
