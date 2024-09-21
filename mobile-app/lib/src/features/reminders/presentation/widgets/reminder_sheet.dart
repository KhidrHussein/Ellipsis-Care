import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';

class ReminderSheet extends StatelessWidget {
  const ReminderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  DraggableScrollableSheet(
      minChildSize: .43,
      initialChildSize: .45,
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
              horizontal:
                  BorderSide(color: AppColors.reminderSheetBorderColor),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 3.h,
                width: 64.w,
                color: AppColors.black,
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    const Text("data"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}