import '../../../../../core/utils/extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/dashboard_appbar.dart';

class ChartDetails extends StatelessWidget {
  const ChartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const DashboardAppbar(title: "Heart rate", canNavigate: true),
            15.sizedBoxHeight,
          ],
        ),
      ),
    );
  }
}
