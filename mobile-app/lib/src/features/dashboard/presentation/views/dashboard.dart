import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../widgets/chart/chart_section.dart';
import '../../../../../core/enums/reminder_options/reminder_options.dart';
import '../widgets/dashboard_section.dart';
// import '../widgets/overview.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: REdgeInsets.only(left: 16, right: 16, top: 16),
        child: const Column(
          children: [
            // Overview(),
            // ChartSection(chartTitle: "Health Overview"),
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
