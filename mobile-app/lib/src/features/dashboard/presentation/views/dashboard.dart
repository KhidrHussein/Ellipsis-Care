import 'package:ellipsis_care/core/utils/enums/reminder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/chart/chart_section.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/overview.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: const Column(
          children: [
            Overview(),
            ChartSection(chartTitle: "Health Overview"),
            DashboardSection(
              name: "Meal & Nutrition",
              type: ReminderType.food,
              progress: 40,
            ),
            DashboardSection(
              name: "Medications",
              type: ReminderType.drug,
              progress: 50,
            )
          ],
        ),
      ),
    );
  }
}
