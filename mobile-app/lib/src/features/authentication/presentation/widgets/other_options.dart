import 'package:ellipsis_care/core/services/oauth_service.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../../../../core/constants/asset_strings.dart';

class AuthenticationOptions extends StatelessWidget {
  const AuthenticationOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton.icon(
          onPressed: () async {
            await injector<OAuthService>().googleSignIn();
          },
          label: Text(
            "Continue with Google",
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: SvgPicture.asset(AssetStrings.google),
        ),
        SizedBox(height: 16.h),
        OutlinedButton.icon(
          onPressed: () {},
          label: Text(
            "Continue with Facebook",
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: SvgPicture.asset(AssetStrings.facebook),
        ),
        SizedBox(height: 16.h),
        OutlinedButton.icon(
          onPressed: () {},
          label: Text(
            "Continue with Apple",
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: SvgPicture.asset(AssetStrings.apple),
        )
      ],
    );
  }
}
