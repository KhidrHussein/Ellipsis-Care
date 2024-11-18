import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 3.h, width: 64.w, color: AppColors.black),
        12.verticalSpace,
        Text(
          "Emergency Contacts",
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ).alignCenter,
        20.verticalSpace,
        Text(
          "My Contacts",
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ).alignLeft,
        5.verticalSpace,
      ],
    );
  }
}
