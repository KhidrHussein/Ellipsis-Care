import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/gen/assets.gen.dart';
import '../../../../../core/utils/helpers.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/extensions.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({
    super.key,
    required this.title,
    this.enableAddButton = false,
    this.showSaveButton = false,
    this.onSaveButtonPressed,
  });

  final String title;
  final bool enableAddButton;
  final bool showSaveButton;
  final VoidCallback? onSaveButtonPressed;

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
        if (enableAddButton) ...<Widget>[
          const Spacer(),
          IconButton(
            onPressed: () => UtilHelpers.pushTo(RouteNames.addData),
            icon: const Icon(Icons.add),
          )
        ],
        if (showSaveButton) ...<Widget>[
          const Spacer(),
          GestureDetector(
            onTap: onSaveButtonPressed,
            child: Text(
              "Save",
              style: context.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ]
      ],
    );
  }
}
