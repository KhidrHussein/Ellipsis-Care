import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/widgets/divider.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/widgets/other_options.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/widgets/textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _canContinue = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _canContinue = false;
    _emailController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                "Sign up",
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Let’s get started",
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 48.h),
              AnimatedCrossFade(
                firstChild: _first(),
                secondChild: _second(),
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeOut,
                crossFadeState: _canContinue
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Durations.medium2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _first() {
    return Column(
      children: [
        AuthenticationField(
          fieldname: "Email",
          hint: "Input your email",
          controller: _emailController,
        ),
        SizedBox(height: 48.h),
        FilledButton(
          onPressed: () {
            if (_emailController.text.isNotEmpty) {
              setState(() => _canContinue = true);
            }
          },
          child: const Text("Continue"),
        ),
        SizedBox(height: 24.h),
        RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: context.textTheme.bodyLarge?.copyWith(fontSize: 14.sp),
            children: [
              TextSpan(
                text: "Sign in",
                recognizer: TapGestureRecognizer()
                  ..onTap = () => UtilHelpers.pushRoute(RouteNames.signIn),
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const AuthenticationDivider(),
        const AuthenticationOptions(),
      ],
    );
  }

  Widget _second() {
    return Column(
      children: [
        AuthenticationField(
          fieldname: "First name",
          hint: "Input your first name",
          controller: _firstnameController,
        ),
        SizedBox(height: 16.h),
        AuthenticationField(
          fieldname: "Last name",
          hint: "Input your last name",
          controller: _lastnameController,
        ),
        SizedBox(height: 16.h),
        PasswordField(
          fieldname: "Password",
          hint: "Enter your password",
          controller: _passwordController,
        ),
        SizedBox(height: 16.h),
        PasswordField(
          fieldname: "Confirm password",
          hint: "Re-enter your password",
          controller: _confirmPasswordController,
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Checkbox.adaptive(
              value: true,
              onChanged: (status) {},
            ),
            Expanded(
              child: Text(
                "I agree with the Terms and Conditions of Ellipsis Care",
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
              ),
            )
          ],
        ),
        SizedBox(height: 24.h),
        FilledButton(
          onPressed: () {
            UtilHelpers.pushRoute(RouteNames.signIn);
          },
          child: const Text("Continue"),
        ),
        SizedBox(height: 18.h),
        RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: context.textTheme.bodyLarge?.copyWith(fontSize: 14.sp),
            children: [
              TextSpan(
                text: "Sign in",
                recognizer: TapGestureRecognizer()
                  ..onTap = () => UtilHelpers.pushRoute(RouteNames.signIn),
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
