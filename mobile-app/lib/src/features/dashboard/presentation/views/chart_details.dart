import 'package:community_charts_flutter/community_charts_flutter.dart';
import 'package:ellipsis_care/core/constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/dashboard_bloc.dart';
import '../widgets/dashboard_appbar.dart';

class ChartDetails extends StatelessWidget {
  const ChartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DashboardBloc>();

    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            DashboardAppbar(
              title: bloc.state.healthOption.name,
              enableAddButton: true,
            ),
            15.sizedBoxHeight,
            SizedBox(
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
            30.sizedBoxHeight,
            Text(
              kHealthChartInfo,
              style: context.textTheme.titleSmall?.copyWith(fontSize: 13.sp),
            ).alignLeft,
          ],
        ),
      ),
    );
  }
}
