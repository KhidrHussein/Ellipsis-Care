import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/extensions.dart';
import '../bloc/auth_bloc.dart';

import '../../../../../core/constants/asset_strings.dart';

class AuthenticationOptions extends StatelessWidget {
  final bool isNewUser;
  const AuthenticationOptions({super.key, this.isNewUser = false});

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = context.read<AuthenticationBloc>();

    return Column(
      children: [
        OutlinedButton.icon(
          onPressed: () => authenticationBloc.add(
            GoogleOAuthEvent(isNewUser: isNewUser),
          ),
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
