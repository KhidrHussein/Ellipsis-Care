import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../widgets/otp_field.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.fromLTRB(16.w, 64.h, 16.w, 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Verify your email",
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "A code has been sent to your email \n\n\n Enter your 6 - digit code",
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 24.h),
              OtpField(controller: _otpController),
              SizedBox(height: 36.h),
              FilledButton(
                onPressed: () {
                  debugPrint(_otpController.text);
                  UtilHelpers.clearPreviousAndPushRoute(RouteNames.signIn);
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
