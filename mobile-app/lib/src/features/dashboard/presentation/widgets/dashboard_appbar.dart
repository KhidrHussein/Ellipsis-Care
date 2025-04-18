import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/gen/assets.gen.dart';
import '../../../../../core/utils/helpers.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/extensions.dart';

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
          onTap: () => UtilHelpers.pop(),
          child: AppAssets.icons.settings.icNavigateBack.svg(),
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
            onPressed: () => UtilHelpers.pushTo(RouteNames.addData),
            icon: const Icon(Icons.add),
          )
        ]
      ],
    );
  }
}
