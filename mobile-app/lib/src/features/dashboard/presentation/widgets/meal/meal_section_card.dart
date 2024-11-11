import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

class MealSectionCard extends StatelessWidget {
  final String icon;
  final String title;
  final String recipe;
  final Color color;
  final int amountOfCalories;
  final bool stretchToFill;

  MealSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.recipe,
    required this.color,
    required this.amountOfCalories,
    this.stretchToFill = false,
  });

  final ValueNotifier<bool> _checkBox = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: stretchToFill ? BoxConstraints(maxHeight: 174.h) : null,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ValueListenableBuilder(
        valueListenable: _checkBox,
        builder: (context, value, child) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Checkbox(
                  value: value,
                  onChanged: (value) => _checkBox.value = value ?? false,
                ),
              ),
              child!
            ],
          );
        },
        child: Padding(
          padding: REdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(icon),
                  5.horizontalSpace,
                  Text(
                    title,
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
              5.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe,
                    style: context.textTheme.bodyMedium,
                  ),
                  Text(
                    "$amountOfCalories calories",
                    style: context.textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
