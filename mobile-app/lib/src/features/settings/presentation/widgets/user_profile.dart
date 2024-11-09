import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/shared/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/utils/extensions.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 16, right: 16, bottom: 25),
      child: Column(
        children: [
          Text(
            "Settings",
            style: context.textTheme.headlineSmall?.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ).alignLeft,
          20.sizedBoxHeight,
          Row(
            children: [
              const UserAvatar(radius: 40),
              16.sizedBoxWidth,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "James David",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  6.sizedBoxHeight,
                  Container(
                    padding: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.outlineBorderColor.withOpacity(.73),
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "jamesmadison@gmail.com",
                      style: context.textTheme.labelMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.userEmailTextColor,
                      ),
                    ),
                  ),
                  8.sizedBoxHeight,
                  GestureDetector(
                    onTap: () =>
                        UtilHelpers.pushRoute(RouteNames.complianceScore),
                    child: Container(
                      padding:
                          REdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            minRadius: 10,
                            backgroundColor: AppColors.white,
                            backgroundImage: AssetImage(AssetStrings.logo),
                          ),
                          5.sizedBoxWidth,
                          Text(
                            "90%",
                            style: context.textTheme.labelSmall?.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
