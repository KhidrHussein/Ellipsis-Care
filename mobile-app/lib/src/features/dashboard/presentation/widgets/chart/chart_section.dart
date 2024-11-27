import 'package:community_charts_flutter/community_charts_flutter.dart';
import '../../../../settings/presentation/widgets/health_option_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/router/route_names.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/utils/helpers.dart';

class ChartSection extends StatelessWidget {
  final String chartTitle;
  const ChartSection({super.key, required this.chartTitle});

  final _items = const ["Day", "Year", "Month", "Week"];

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
            color: context.themeExtension.dashboardScaffoldColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const HealthOptionPicker(),
                  // const Spacer(),
                  IconButton(
                    onPressed: () => UtilHelpers.pushTo(RouteNames.addData),
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () =>
                        UtilHelpers.pushTo(RouteNames.chartDetails),
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
                        "",
                        style: context.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "",
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: .5.sw,
                    height: .2.sh,
                    child: BarChart(
                      [
                        Series(
                          id: "",
                          displayName: "Some chart",
                          data: [],
                          domainFn: (data, index) {
                            return "data";
                          },
                          measureFn: (data, index) {
                            return 4;
                          },
                        )
                      ],
                    ),
                  ),
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
