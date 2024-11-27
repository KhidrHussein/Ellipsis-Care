import '../../../../../core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsGroup extends StatelessWidget {
  final String? groupName;
  final List<Widget> options;
  const SettingsGroup({super.key, this.groupName, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (groupName != null) ...[
          Text(
            groupName!,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          6.sizedBoxHeight,
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Column(
            children: options,
          ),
        ),
        10.sizedBoxHeight,
      ],
    );
  }
}
