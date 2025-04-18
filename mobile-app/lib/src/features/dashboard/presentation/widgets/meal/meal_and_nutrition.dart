import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/gen/assets.gen.dart';
import '../../../../../../core/utils/utils.dart';
import '../../controller/dashboard_bloc.dart';
import '../../../../../shared/widgets/progress_bar.dart';

import 'nutrition_card.dart';

class MealAndNutrition extends StatelessWidget {
  const MealAndNutrition({super.key});

  void _updateProgress(BuildContext context, bool value) {
    // if (value) {
    //   context.read<DashboardBloc>().add(AddToMealProgress());
    // } else {
    //   context.read<DashboardBloc>().add(SubtractFromMealProgress());
    // }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DashboardBloc>();

    return Column(
      children: [
        ProgressBar(
          icon: AppAssets.icons.icFood.path,
          title: "Meal & Nutrition",
          type: ReminderType.food,
          progress: bloc.state.mealProgress * 25,
        ),
        10.verticalSpace,
        NutritionCard(
          title: "Breakfast",
          recipe: "Oats with milk",
          amountOfCalories: 300,
          icon: AppAssets.icons.dashboard.icBreakfast.path,
          color: context.themeExtension.breakfastCardColor,
          onChanged: (value) => _updateProgress(context, value),
        ),
        5.verticalSpace,
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  NutritionCard(
                    title: "Lunch",
                    recipe: "Oats with milk",
                    amountOfCalories: 300,
                    icon: AppAssets.icons.dashboard.icLunch.path,
                    color: context.themeExtension.lunchCardColor,
                    onChanged: (value) => _updateProgress(context, value),
                  ),
                  5.verticalSpace,
                  NutritionCard(
                    title: "Snacks",
                    recipe: "Oats with milk",
                    amountOfCalories: 300,
                    icon: AppAssets.icons.dashboard.icSnacks.path,
                    color: context.themeExtension.snacksCardColor,
                    onChanged: (value) => _updateProgress(context, value),
                  ),
                ],
              ),
            ),
            5.horizontalSpace,
            Expanded(
              child: Column(
                children: [
                  NutritionCard(
                    title: "Dinner",
                    recipe: "Oats with milk",
                    amountOfCalories: 300,
                    stretchToFill: true,
                    icon: AppAssets.icons.dashboard.icDinner.path,
                    color: context.themeExtension.dinnerCardColor,
                    onChanged: (value) => _updateProgress(context, value),
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
