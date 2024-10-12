import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReminderSection extends StatelessWidget {
  final String sectionName;
  final Widget subsection;

  const AddReminderSection({
    super.key,
    required this.sectionName,
    required this.subsection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          sectionName,
          style: context.textTheme.headlineMedium?.copyWith(fontSize: 15.sp),
        ).alignLeft,
        5.sizedBoxHeight,
        subsection,
        10.sizedBoxHeight,
      ],
    );
  }
}
