import 'package:ellipsis_care/core/services/api_service.dart';
import 'package:ellipsis_care/core/utils/enums/api_state.dart';

import '../bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions.dart';

import '../widgets/otp_field.dart';

class VerifyEmail extends StatefulWidget {
  final String email;
  const VerifyEmail({super.key, required this.email});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = context.read<AuthenticationBloc>();

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
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                bloc: authenticationBloc,
                listener: (context, state) {
                  switch (state.apiState) {
                    case ApiState.success:
                      UtilHelpers.goTo(RouteNames.home);
                      break;
                    case ApiState.failed:
                      UtilHelpers.showAlert(
                          title: "Error", message: state.error);
                      break;
                    default:
                      break;
                  }
                },
                builder: (context, state) {
                  return FilledButton(
                    onPressed: switch (state.apiState) {
                      ApiState.loading => null,
                      _ => () {
                          authenticationBloc.add(
                            OTPVerificationEvent(
                              email: widget.email,
                              verificationCode: _otpController.text,
                            ),
                          );

                          // debugPrint(_otpController.text);
                        }
                    },
                    child: const Text("Continue"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}