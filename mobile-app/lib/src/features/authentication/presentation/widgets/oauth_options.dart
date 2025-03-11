import 'package:ellipsis_care/config/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions.dart';
import '../bloc/auth_bloc.dart';


class OAuthOptions extends StatelessWidget {
  const OAuthOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = context.read<AuthenticationBloc>();

    return Column(
      children: [
        OutlinedButton.icon(
          onPressed: () => authenticationBloc.add(
            GoogleOAuthEvent(),
          ),
          label: Text(
            "Continue with Google",
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: AppAssets.icons.authentication.icGoogle.svg(),
        ),
        // SizedBox(height: 16.h),
        // OutlinedButton.icon(
        //   onPressed: () {},
        //   label: Text(
        //     "Continue with Facebook",
        //     style: context.textTheme.bodyMedium?.copyWith(
        //       fontSize: 15.sp,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        //   icon: SvgPicture.asset(AssetStrings.facebook),
        // ),
        // SizedBox(height: 16.h),
        // OutlinedButton.icon(
        //   onPressed: () {},
        //   label: Text(
        //     "Continue with Apple",
        //     style: context.textTheme.bodyMedium?.copyWith(
        //       fontSize: 15.sp,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        //   icon: SvgPicture.asset(AssetStrings.apple),
        // )
      ],
    );
  }
}
