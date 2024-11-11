import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Dashboard",
          style: context.textTheme.headlineSmall?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w700,
          ),
        ).alignLeft,
        30.sizedBoxHeight,
        const Placeholder(fallbackHeight: 180),
        30.sizedBoxHeight,
      ],
    );
  }
}
