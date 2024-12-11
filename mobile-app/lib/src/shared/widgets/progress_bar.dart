import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/enums/reminder_options/reminder_options.dart';
import '../../../core/utils/extensions.dart';

class ProgressBar extends StatelessWidget {
  final String? icon;
  final int progress;
  final String title;
  final ReminderType type;

  ProgressBar({
    super.key,
    this.icon,
    this.progress = 0,
    required this.type,
    required this.title,
  });

  final Tween<double> _indicatorValue = Tween<double>(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Container(
            padding: REdgeInsets.all(2.r),
            decoration: BoxDecoration(
              color: switch (type) {
                ReminderType.drug => context.themeExtension.drugBgColor,
                ReminderType.food => context.themeExtension.foodBgColor,
              },
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: SvgPicture.asset(
              icon!,
              width: 28,
              colorFilter: ColorFilter.mode(
                switch (type) {
                  ReminderType.drug => context.themeExtension.drugColor,
                  ReminderType.food => context.themeExtension.foodColor,
                },
                BlendMode.srcIn,
              ),
            ),
          ),
          5.horizontalSpace
        ],
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style:
                        context.textTheme.labelLarge?.copyWith(fontSize: 14.sp),
                  ),
                  const Spacer(),
                  Text(
                    "$progress% done",
                    style: context.textTheme.labelSmall?.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              TweenAnimationBuilder(
                tween: _indicatorValue,
                duration: Durations.extralong4,
                builder: (context, value, _) {
                  return LinearProgressIndicator(
                    value: progress * value * 0.01,
                    minHeight: 7.h,
                    borderRadius: BorderRadius.circular(8.r),
                    color: switch (type) {
                      ReminderType.drug => context.themeExtension.drugColor,
                      ReminderType.food => context.themeExtension.foodColor,
                    },
                    backgroundColor: switch (type) {
                      ReminderType.drug => context.themeExtension.drugBgColor,
                      ReminderType.food => context.themeExtension.foodBgColor,
                    },
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}