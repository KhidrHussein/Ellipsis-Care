import 'package:ellipsis_care/src/features/reminders/presentation/views/add_reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';

class ReminderSheet extends StatelessWidget {
  const ReminderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: .35,
      initialChildSize: .4,
      builder: (context, scrollController) {
        return Container(
          padding: REdgeInsets.only(left: 27.w, right: 27.w, top: 6.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            border: const Border.symmetric(
              horizontal: BorderSide(color: AppColors.reminderSheetBorderColor),
            ),
          ),
          child: Column(
            children: [
              Container(height: 3.h, width: 64.w, color: AppColors.black),
              12.sizedBoxHeight,
              Text(
                "data",
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ).alignLeft,
              10.sizedBoxHeight,
              TextButton(
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => AddReminder(),
                  );
                },
                child: Text("Add Reminder"),
              )
              // ConstrainedBox(
              //   constraints: BoxConstraints(
              //       maxHeight: scrollController.position.maxScrollExtent),
              //   child: Timeline.tileBuilder(
              //     controller: scrollController,
              //     builder: TimelineTileBuilder(
              //       itemCount: 4,
              //       contentsBuilder: (context, index) {
              //         return const ReminderTile(
              //             reminderType: ReminderType.drug);
              //       },
              //       indicatorPositionBuilder: (context, index) {
              //         return 0;
              //       },
              //       // nodePositionBuilder: (context, index) {
              //       //   return 30;
              //       // },
              //     ),
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
