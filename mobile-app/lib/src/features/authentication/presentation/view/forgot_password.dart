import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
                "Forgot your Password",
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Enter your registered number to receive a “How to reset your password” mail",
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 48.h),
              AppTextField(
                fieldname: "Email Address",
                hint: "Input your email",
                controller: _emailController,
              ),
              SizedBox(height: 36.h),
              FilledButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
              SizedBox(height: 28.h),
              OutlinedButton(
                onPressed: UtilHelpers.popRoute,
                style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                      side: const WidgetStatePropertyAll(BorderSide.none),
                      textStyle: WidgetStatePropertyAll(
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                child: const Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
