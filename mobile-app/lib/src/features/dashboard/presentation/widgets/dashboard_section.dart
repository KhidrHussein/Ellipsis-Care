import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/enums/reminder.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/meal/meal_section.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/medication/medication_section.dart';
import 'package:ellipsis_care/src/shared/progress_bar.dart';

import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/constants/colors.dart';

class DashboardSection extends StatelessWidget {
  final String name;
  final ReminderType type;
  final int progress;

  const DashboardSection({
    super.key,
    required this.name,
    required this.type,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ).alignLeft,
        10.sizedBoxHeight,
        Container(
          padding: REdgeInsets.all(15),
          constraints: BoxConstraints(minWidth: .9.sw, minHeight: .3.sh),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(21.r),
          ),
          child: Column(
            children: [
              ProgressBar(
                icon: switch (type) {
                  ReminderType.food => AssetStrings.foodIcon,
                  ReminderType.drug => AssetStrings.drugIcon,
                },
                title: name,
                type: type,
                progress: progress,
              ),
              20.verticalSpace,
              switch (type) {
                ReminderType.food => const MealAndNutritionSection(),
                ReminderType.drug => const MedicationSection()
              },
            ],
          ),
        ),
        30.sizedBoxHeight,
      ],
    );
  }
}
