import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardAppbar extends StatelessWidget {
  final String title;
  final bool canNavigate;
  
  const DashboardAppbar({
    super.key,
    required this.title,
    this.canNavigate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => UtilHelpers.popRoute(),
          child: SvgPicture.asset(AssetStrings.navigateBackIcon),
        ),
        5.sizedBoxWidth,
        Text(
          title,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (canNavigate) ...<Widget>[
          const Spacer(),
          IconButton(
            onPressed: () => UtilHelpers.pushRoute(RouteNames.addData),
            icon: const Icon(Icons.add),
          )
        ]
      ],
    );
  }
}
