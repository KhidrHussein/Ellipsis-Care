import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';

class ChatBubble extends StatelessWidget {
  final String data;
  final bool isUser;
  const ChatBubble({super.key, required this.data, this.isUser = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (isUser)
            Container(
              constraints: BoxConstraints(minWidth: 314.w),
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.chatBubbleBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
              ),
              child: Text(
                data,
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
              ),
            )
          else ...[
            const CircleAvatar(
              backgroundColor: AppColors.white,
              maxRadius: 20,
              backgroundImage: AssetImage(AssetStrings.logo),
            ),
            SizedBox(width: 8.w),
            Container(
              constraints: BoxConstraints(minWidth: 290.w),
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                data,
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
