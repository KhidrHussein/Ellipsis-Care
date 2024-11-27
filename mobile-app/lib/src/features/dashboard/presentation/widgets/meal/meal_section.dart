import '../../../../../../core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/asset_strings.dart';
import 'meal_section_card.dart';

class MealAndNutritionSection extends StatelessWidget {
  const MealAndNutritionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MealSectionCard(
          title: "Breakfast",
          recipe: "Oats with milk",
          amountOfCalories: 300,
          icon: AssetStrings.breakfastIcon,
          color: context.themeExtension.breakfastCardColor,
        ),
        5.verticalSpace,
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  MealSectionCard(
                    title: "Lunch",
                    recipe: "Oats with milk",
                    amountOfCalories: 300,
                    icon: AssetStrings.lunchIcon,
                    color: context.themeExtension.lunchCardColor,
                  ),
                  5.verticalSpace,
                  MealSectionCard(
                    title: "Snacks",
                    recipe: "Oats with milk",
                    amountOfCalories: 300,
                    icon: AssetStrings.snacksIcon,
                    color: context.themeExtension.snacksCardColor,
                  ),
                ],
              ),
            ),
            5.horizontalSpace,
            Expanded(
              child: Column(
                children: [
                  MealSectionCard(
                    title: "Dinner",
                    recipe: "Oats with milk",
                    amountOfCalories: 300,
                    stretchToFill: true,
                    icon: AssetStrings.dinnerIcon,
                    color: context.themeExtension.dinnerCardColor,
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
