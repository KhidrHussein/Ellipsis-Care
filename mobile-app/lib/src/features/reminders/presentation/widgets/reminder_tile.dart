import 'package:dotted_border/dotted_border.dart';
import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/reminders/models/reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

class ReminderTile extends StatefulWidget {
  final ReminderModel reminder;
  const ReminderTile({super.key, required this.reminder});

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {
  final ValueNotifier<bool> _showOptions = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _showOptions,
      builder: (context, value, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child!,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 7),
              child: Column(
                children: [
                  AnimatedContainer(
                    width: 13.w,
                    height: 13.h,
                    duration: Durations.long1,
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: AppColors.reminderTileCheckColor,
                    ),
                    child: widget.reminder.eventIsCompleted
                        ? const Icon(Icons.check,
                            size: 12, color: AppColors.white)
                        : const DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.white, shape: BoxShape.circle),
                            child: SizedBox.square(dimension: 10),
                          ),
                  ),
                  AnimatedSize(
                    duration: Durations.short4,
                    child: Container(
                      width: 1.w,
                      height: _showOptions.value ? 125.h : 65.h,
                      decoration: const BoxDecoration(
                          color: AppColors.reminderTileCheckColor),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AnimatedSize(
                duration: Durations.short4,
                child: GestureDetector(
                  onTap: () => _showOptions.value = true,
                  child: DottedBorder(
                    strokeWidth: 2,
                    dashPattern: const [12, 8],
                    borderType: BorderType.RRect,
                    color: widget.reminder.type.borderColor,
                    radius: Radius.circular(10.r),
                    padding: [12, 8].symmetricPadding,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: REdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: widget.reminder.type.backgroundColor,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: SvgPicture.asset(
                                widget.reminder.type.icon,
                                fit: BoxFit.cover,
                              ),
                            ),
                            12.sizedBoxWidth,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.reminder.name,
                                    style:
                                        context.textTheme.bodyLarge?.copyWith(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Text(
                                    widget.reminder.dosage,
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: value ? 1 : 0,
                              duration: Durations.short1,
                              child: const Icon(Icons.edit).alignCenter,
                            )
                          ],
                        ),
                        if (value)
                          Column(
                            children: [
                              12.sizedBoxHeight,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FilledButton(
                                      onPressed: () {
                                        widget.reminder
                                            .copyWith(eventIsCompleted: true);
                                      },
                                      style: FilledButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        fixedSize: Size(102.w, 40.h),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      child: Text(
                                        "Completed",
                                        style: context.textTheme.labelLarge
                                            ?.copyWith(
                                          fontSize: 15.sp,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  16.sizedBoxWidth,
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => _showOptions.value = false,
                                      style: TextButton.styleFrom(
                                        fixedSize: Size(102.w, 40.h),
                                        padding: REdgeInsets.symmetric(
                                            horizontal: 26, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: AppColors.black),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      child: Text(
                                        "Cancel",
                                        style: context.textTheme.labelLarge
                                            ?.copyWith(
                                          fontSize: 15.sp,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: Text(
        UtilHelpers.timeFormatter1(widget.reminder.startDate),
        style: context.textTheme.labelLarge?.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
