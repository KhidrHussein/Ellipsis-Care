import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

class SettingsBar extends StatelessWidget {
  const SettingsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        SizedBox(width: 16.w),
        Text(
          "Settings",
          style: context.textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
        ),
      ],
    );
  }
}
