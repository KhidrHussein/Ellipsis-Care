import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';

class HomeActionChip extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;

  const HomeActionChip({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minWidth: 92.w, minHeight: 76.h),
        margin: REdgeInsets.only(right: 10),
        padding: REdgeInsets.symmetric(horizontal: 15, vertical: 9),
        decoration: BoxDecoration(
          color: AppColors.dashboardActionBgColor,
          border: Border.all(color: AppColors.generalOutlineBorder),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                color: AppColors.dashboardActionFontColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
