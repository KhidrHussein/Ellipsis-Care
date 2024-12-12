import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions.dart';

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
        // SizedBox(
        //   width: .4.sw,
        //   height: .2.sh,
        //   child: PieChart(
        //     [
        //       Series(
        //         id: "",
        //         data: [],
        //         domainFn: (data, index) => "",
        //         measureFn: (data, index) => 4,
        //       )
        //     ],
        //   ),
        // ),
        30.sizedBoxHeight,
      ],
    );
  }
}
