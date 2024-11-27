import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions.dart';
import '../widgets/dashboard_appbar.dart';

class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const DashboardAppbar(title: "Add Data"),
            30.sizedBoxHeight,
          ],
        ),
      ),
    );
  }
}
