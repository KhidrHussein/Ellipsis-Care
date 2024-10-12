import 'package:ellipsis_care/core/utils/enums/reminder.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/widgets/add_reminder_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/colors.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({super.key});

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      color: AppColors.white,
      margin: REdgeInsets.symmetric(horizontal: 16, vertical: 99),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          children: [
            Text(
              "Add New Reminder",
              style: context.textTheme.headlineMedium?.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            10.sizedBoxHeight,
            const AddReminderSection(
              sectionName: "Name",
              subsection: TextField(),
            ),
            AddReminderSection(
              sectionName: "Type",
              subsection: Row(
                children: ReminderType.values
                    .map(
                      (reminderType) => GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: REdgeInsets.only(right: 10),
                          padding: REdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: reminderType.backgroundColor,
                            borderRadius: BorderRadius.circular(5.r),
                            border: reminderType.isPicked
                                ? Border.all(color: AppColors.black)
                                : null,
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(reminderType.icon),
                              10.sizedBoxHeight,
                              Text(
                                reminderType.name,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.black.withOpacity(.3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
