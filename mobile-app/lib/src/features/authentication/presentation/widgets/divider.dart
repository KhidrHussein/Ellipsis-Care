import '../../../../../core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthenticationDivider extends StatelessWidget {
  const AuthenticationDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: context.textTheme.bodyMedium?.color,
              indent: 5.w,
              endIndent: 10.w,
            ),
          ),
          Text(
            "OR",
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Divider(
              color: context.textTheme.bodyMedium?.color,
              indent: 10.w,
              endIndent: 5.w,
            ),
          ),
        ],
      ),
    );
  }
}
