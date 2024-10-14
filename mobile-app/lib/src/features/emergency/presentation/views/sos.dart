import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../../../../core/constants/asset_strings.dart';

class SosPage extends StatelessWidget {
  const SosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => UtilHelpers.pushRoute(RouteNames.emergency),
        child: Center(
          child: Container(
            height: 300.h,
            width: 300.h,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.red),
            child: Text(
              "SOS",
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 96.sp,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontFamily: AssetStrings.visbyRoundCF,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
