import 'package:community_charts_flutter/community_charts_flutter.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../settings/presentation/widgets/health_option_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/router/route_names.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/utils/helpers.dart';

class ChartSection extends StatelessWidget {
  const ChartSection({super.key, required this.chartTitle});

  final String chartTitle;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DashboardBloc>();

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
          decoration: BoxDecoration(
            color: context.themeData.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Padding(
                padding: REdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  children: [
                    const HealthOptionPicker(),
                    const Spacer(),
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
              ),
              16.sizedBoxHeight,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: REdgeInsets.only(left: 15, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bloc.state.healthOption.name,
                            style: context.textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          4.verticalSpace,
                          Text("24/04/2025",
                              style: context.textTheme.labelSmall),
                          20.verticalSpace,
                          Text(
                            " ${bloc.state.healthOption.unitsOfMeasurement.first}",
                            style: context.textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          4.verticalSpace,
                          Text("1 min ago",
                              style: context.textTheme.labelSmall),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
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
