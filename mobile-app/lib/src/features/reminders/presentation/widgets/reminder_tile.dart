import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/enums/reminder.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import '../../models/reminder.dart';

class ReminderTile extends StatefulWidget {
  final ReminderModel reminder;
  const ReminderTile({super.key, required this.reminder});

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {
  final ValueNotifier<bool> _showOptions = ValueNotifier(false);
  late bool _markedAsCompleted;

  @override
  void initState() {
    super.initState();
    _markedAsCompleted = widget.reminder.eventIsCompleted;
  }

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
                    child: _markedAsCompleted
                        ? Icon(Icons.check,
                            size: 12,
                            color: context.themeExtension.reminderColor)
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
                      height: _showOptions.value ? 115.h : 55.h,
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
                  onTap: () {
                    if (!_markedAsCompleted) {
                      _showOptions.value = !_showOptions.value;
                    }
                  },
                  child: DottedBorder(
                    strokeWidth: 2,
                    padding: [12, 8].symmetricPadding,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12.r),
                    dashPattern: _markedAsCompleted ? [8, 0] : const [8, 4],
                    color: switch (widget.reminder.type) {
                      ReminderType.drug => context.themeExtension.drugColor,
                      ReminderType.food => context.themeExtension.foodColor,
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: switch (widget.reminder.type) {
                                  ReminderType.drug =>
                                    context.themeExtension.drugBgColor,
                                  ReminderType.food =>
                                    context.themeExtension.foodBgColor,
                                },
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: SvgPicture.asset(
                                widget.reminder.type.icon,
                                width: 36.w,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  switch (widget.reminder.type) {
                                    ReminderType.drug =>
                                      context.themeExtension.drugColor,
                                    ReminderType.food =>
                                      context.themeExtension.foodColor,
                                  },
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            12.horizontalSpace,
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
                            // AnimatedOpacity(
                            //   opacity: value ? 1 : 0,
                            //   duration: Durations.short1,
                            //   child: SvgPicture.asset(
                            //     AssetStrings.editIcon,
                            //     colorFilter: ColorFilter.mode(
                            //       context.themeExtension.reminderInverseColor,
                            //       BlendMode.srcIn,
                            //     ),
                            //   ).alignCenter,
                            // )
                          ],
                        ),
                        if (value)
                          Column(
                            children: [
                              12.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FilledButton(
                                      onPressed: () {
                                        setState(
                                            () => _markedAsCompleted = true);
                                        widget.reminder.copyWith(
                                            eventIsCompleted:
                                                _markedAsCompleted);
                                        _showOptions.value = false;
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
                                          color: context
                                              .themeExtension.reminderColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  16.horizontalSpace,
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () =>
                                          _showOptions.value = false,
                                      style: TextButton.styleFrom(
                                        fixedSize: Size(102.w, 40.h),
                                        padding: REdgeInsets.symmetric(
                                            horizontal: 26, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: context.themeExtension
                                                  .reminderInverseColor),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      child: Text(
                                        "Cancel",
                                        style: context.textTheme.labelLarge
                                            ?.copyWith(
                                          fontSize: 15.sp,
                                          color: context.themeExtension
                                              .reminderInverseColor,
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
