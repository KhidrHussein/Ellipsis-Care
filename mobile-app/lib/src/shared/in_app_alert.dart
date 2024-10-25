import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/asset_strings.dart';
import '../../core/utils/extensions.dart';

import '../../core/constants/colors.dart';

final Tween<double> _indicatorValue = Tween<double>(begin: 0.0, end: 1.0);

class InAppAlert extends StatelessWidget {
  final String title;
  final String message;
  final Duration duration;

  const InAppAlert({
    super.key,
    required this.title,
    required this.message,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .9.sw,
      constraints: BoxConstraints.loose(const Size(300, 94)),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 14,
            offset: const Offset(0, 4),
            color: AppColors.black.withOpacity(.15),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: REdgeInsets.fromLTRB(15, 9, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_sharp,
                    color: AppColors.alertInfoIconColor),
                SizedBox(width: 13.w),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: AssetStrings.colfax,
                          color: AppColors.alertTitleTextColor,
                        ),
                      ),
                      Text(
                        message,
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: AssetStrings.colfax,
                          color: AppColors.alertMessageTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TweenAnimationBuilder(
            tween: _indicatorValue,
            duration: duration,
            builder: (context, value, _) {
              return LinearProgressIndicator(
                backgroundColor: AppColors.white,
                value: value,
                color: AppColors.alertIndicatorColor,
              );
            },
          )
        ],
      ),
    );
  }
}
