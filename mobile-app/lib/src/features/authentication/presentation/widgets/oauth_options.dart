import '../../../../../core/services/oauth_service.dart';
import '../../../../../core/utils/locator.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../../../../core/constants/asset_strings.dart';

class AuthenticationOptions extends StatelessWidget {
  final bool currentScopeIsLogin;
  const AuthenticationOptions({super.key, this.currentScopeIsLogin = false});

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = context.read<AuthenticationBloc>();

    return Column(
      children: [
        OutlinedButton.icon(
          onPressed: () async {
            await injector<OAuthService>().googleSignIn().then((accountInfo) {
              if (currentScopeIsLogin) {
                authenticationBloc.add(
                  SignInEvent(email: accountInfo?.email),
                );
              } else {
                authenticationBloc.add(
                  SignUpEvent(
                    email: accountInfo?.email,
                    userName: accountInfo?.displayName,
                  ),
                );
              }
            });
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
