import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/enums/reminder.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';

class ReminderTile extends StatelessWidget {
  final ReminderType reminderType;
  const ReminderTile({super.key, required this.reminderType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: DottedBorder(
        strokeWidth: 2,
        dashPattern: const [12, 8],
        borderType: BorderType.RRect,
        color: reminderType.borderColor,
        radius: Radius.circular(10.r),
        padding: [12, 8].symmetricPadding,
        child: Row(
          children: [
            Container(
              padding: REdgeInsets.all(8),
              decoration: BoxDecoration(
                color: reminderType.backgroundColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: SvgPicture.asset(reminderType.icon,
                  width: 28.w, fit: BoxFit.cover),
            ),
            12.sizedBoxWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "data",
                    style:
                        context.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
                  ),
                  Text(
                    "few",
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
