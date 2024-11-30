import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';

class AIChatBubble extends StatelessWidget {
  final String aiResponse;
  const AIChatBubble({super.key, required this.aiResponse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.white,
            maxRadius: 20,
            backgroundImage: AssetImage(AssetStrings.logo),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Container(
              constraints: BoxConstraints(minWidth: 290.w),
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                aiResponse,
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserChatBubble extends StatelessWidget {
  final String transcription;
  const UserChatBubble({super.key, required this.transcription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 314.w),
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: context.themeExtension.homeColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),
            child: Text(
              transcription,
              style: context.textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
            ),
          ),
        ],
      ),
    );
  }
}
