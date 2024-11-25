import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/widgets/pickers/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../../../../../core/constants/colors.dart';

class DatePicker extends StatefulWidget {
  final String hint;
  final ValueNotifier<DateTime?> dateListenable;
  final ValueNotifier<TimeOfDay?> timeListenable;

  const DatePicker({
    super.key,
    required this.hint,
    required this.dateListenable,
    required this.timeListenable,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;
  final OverlayPortalController _portalController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          //FIXME: change the border color here
          border: Border.all(color: AppColors.homeColorLight),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(
              valueListenable: widget.dateListenable,
              builder: (context, value, child) {
                return Text(
                  value != null
                      ? UtilHelpers.dateFormatter1(value)
                      : widget.hint,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: value != null
                        ? context.textTheme.bodyMedium?.color
                        : context.textTheme.bodyMedium?.color?.withOpacity(.3),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () => _portalController.show(),
              child: OverlayPortal(
                controller: _portalController,
                overlayChildBuilder: (context) {
                  return Positioned(
                    bottom: 75,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: 1.sw, maxHeight: .55.sh),
                      child: Dialog(
                        backgroundColor: context.themeExtension.reminderColor,
                        shadowColor: context.themeExtension.reminderInverseColor,
                        shape: const ContinuousRectangleBorder(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: REdgeInsets.all(9),
                              child: Row(
                                children: [
                                  Text(
                                    "Time",
                                    style: context.textTheme.titleLarge
                                        ?.copyWith(fontSize: 20.sp),
                                  ),
                                  const Spacer(),
                                  TimePicker(
                                    onTimePicked: (time) =>
                                        widget.timeListenable.value = time,
                                  ),
                                ],
                              ),
                            ),
                            CalendarDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030),
                              currentDate: _selectedDate,
                              onDateChanged: (value) {
                                widget.dateListenable.value = value;
                                _portalController.hide();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.calendar_month),
              ),
            )
          ],
        ),
      ),
    );
  }
}
