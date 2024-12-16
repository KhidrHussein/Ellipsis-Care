import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/src/shared/user_bloc/user_bloc.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import '../../../../shared/widgets/user_avatar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = context.watch<UserBloc>().state;

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
                    "${userBloc.user?.firstname ?? ""} ${userBloc.user?.lastname ?? ""} ",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  6.sizedBoxHeight,
                  Container(
                    padding: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: context.textTheme.labelMedium?.color,
                      // FIXME: use the correct color for border
                      border: Border.all(
                        color: AppColors.white,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "${userBloc.user?.email ?? ""} ",
                      style: context.textTheme.labelMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.userEmailTextColor,
                      ),
                    ),
                  ),
                  8.sizedBoxHeight,
                  GestureDetector(
                    onTap: () => UtilHelpers.pushTo(RouteNames.complianceScore),
                    child: Container(
                      padding:
                          REdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        // FIXME: adjust color here. let it react to changes in inner widget
                        // color: AppColors.white,
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
