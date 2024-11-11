import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/asset_strings.dart';
import '../../../../../../core/constants/colors.dart';
import 'meal_section_card.dart';

class MealAndNutritionSection extends StatelessWidget {
  const MealAndNutritionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MealSectionCard(
          icon: AssetStrings.breakfastIcon,
          title: "Breakfast",
          recipe: "Oats with milk",
          color: AppColors.breakfastCardColor,
          amountOfCalories: 300,
        ),
        5.verticalSpace,
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  MealSectionCard(
                    icon: AssetStrings.lunchIcon,
                    title: "Lunch",
                    color: AppColors.lunchCardColor,
                    recipe: "Oats with milk",
                    amountOfCalories: 300,
                  ),
                  5.verticalSpace,
                  MealSectionCard(
                    icon: AssetStrings.snacksIcon,
                    title: "Snacks",
                    color: AppColors.snacksCardColor,
                    recipe: "Oats with milk",
                    amountOfCalories: 300,
                  ),
                ],
              ),
            ),
            5.horizontalSpace,
            Expanded(
              child: Column(
                children: [
                  MealSectionCard(
                    icon: AssetStrings.dinnerIcon,
                    title: "Dinner",
                    color: AppColors.dinnerCardColor,
                    recipe: "Oats with milk",
                    amountOfCalories: 300,
                    stretchToFill: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        10.verticalSpace,
        FilledButton(
          onPressed: () {},
          style: context.filledButtonTheme?.copyWith(
            padding:
                WidgetStatePropertyAll(REdgeInsets.symmetric(horizontal: 10)),
            fixedSize: WidgetStatePropertyAll(
              Size(170.w, 40.h),
            ),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
              ),
            ),
          ),
          child: const Text("Generate custom Meal"),
        ).alignLeft
      ],
    );
  }
}
