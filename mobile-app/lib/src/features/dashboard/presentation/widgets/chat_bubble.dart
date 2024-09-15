import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';

class ChatBubble extends StatelessWidget {
  final String data;
  final bool isUser;
  const ChatBubble({super.key, required this.data, this.isUser = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        children: isUser
            ? [
                Expanded(
                  child: Container(
                    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.outlinedButtonBorder),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      data,
                      style:
                          context.textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                const CircleAvatar()
              ]
            : [
                const CircleAvatar(
                  backgroundColor: AppColors.white,
                  backgroundImage: AssetImage(AssetStrings.logo),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1E3E2),
                      border: Border.all(color: AppColors.outlinedButtonBorder),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      data,
                      style:
                          context.textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
