import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';

import '../../../../../../core/constants/colors.dart';

class ChartSection extends StatelessWidget {
  final String chartTitle;
  const ChartSection({super.key, required this.chartTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          chartTitle,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ).alignLeft,
        10.sizedBoxHeight,
        Container(
          padding: REdgeInsets.all(5),
          constraints: BoxConstraints(minWidth: 361.w, minHeight: 154.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Placeholder(fallbackWidth: 40, fallbackHeight: 20),
                  const Spacer(),
                  IconButton(
                    onPressed: () => UtilHelpers.pushRoute(RouteNames.addData),
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () =>
                        UtilHelpers.pushRoute(RouteNames.chartDetails),
                    icon: const Icon(Icons.navigate_next),
                  )
                ],
              ),
              16.sizedBoxHeight,
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        chartTitle,
                        style: context.textTheme.titleSmall,
                      ),
                      Text(
                        chartTitle,
                        style: context.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  const Flexible(
                    flex: 9,
                    child: Placeholder(fallbackHeight: 140),
                  )
                ],
              )
            ],
          ),
        ),
        30.sizedBoxHeight,
      ],
    );
  }
}
