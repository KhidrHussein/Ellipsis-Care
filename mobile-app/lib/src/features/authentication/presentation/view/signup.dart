import 'package:ellipsis_care/core/enums/api_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:ellipsis_care/src/shared/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> _hasAcceptedTerms = ValueNotifier(false);

  @override
  void dispose() {
    _reset();
    _emailController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    AppTextField(
                      fieldname: "First name",
                      hint: "Input your first name",
                      controller: _firstnameController,
                      validator: (input) =>
                          UtilHelpers.nameValidator(input?.trim()),
                    ),
                    SizedBox(height: 16.h),
                    AppTextField(
                      fieldname: "Last name",
                      hint: "Input your last name",
                      controller: _lastnameController,
                      validator: (input) =>
                          UtilHelpers.nameValidator(input?.trim()),
                    ),
                    SizedBox(height: 16.h),
                    PasswordField(
                      fieldname: "Password",
                      hint: "Enter your password",
                      controller: _passwordController,
                      validator: (input) =>
                          UtilHelpers.passwordValidator(input),
                    ),
                    SizedBox(height: 16.h),
                    PasswordField(
                      fieldname: "Confirm password",
                      hint: "Re-enter your password",
                      controller: _confirmPasswordController,
                      validator: (input) =>
                          UtilHelpers.confirmPasswordValidator(input,
                              oldPassword: _passwordController.text),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        ValueListenableBuilder<bool>(
                          valueListenable: _hasAcceptedTerms,
                          builder: (context, value, child) {
                            return Checkbox(
                              value: value,
                              isError: !value,
                              onChanged: (status) =>
                                  _hasAcceptedTerms.value = status!,
                            );
                          },
                        ),
                        Expanded(
                          child: Text(
                            "I agree with the Terms and Conditions of Ellipsis Care",
                            style: context.textTheme.bodyLarge
                                ?.copyWith(fontSize: 15.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.h),
                    BlocConsumer<AuthenticationBloc, AuthenticationState>(
                      listener: (context, blocState) {
                        switch (blocState.state) {
                          case ApiState.success:
                            UtilHelpers.showSuccess(blocState.message);
                            UtilHelpers.pushTo(
                              RouteNames.verifyEmail,
                              {"email": _emailController.text},
                            );
                          case ApiState.failed:
                            UtilHelpers.showError(blocState.error);
                          default:
                        }
                      },
                      builder: (context, blocState) {
                        return FilledButton(
                          onPressed: switch (blocState.state) {
                            ApiState.loading => null,
                            _ => () {
                                if (_formKey.currentState!.validate() &&
                                    _hasAcceptedTerms.value) {
                                  authBloc.add(
                                    SignUpEvent(
                                      email: _emailController.text,
                                      firstName: _firstnameController.text,
                                      lastName: _lastnameController.text,
                                      password: _passwordController.text,
                                      hasAcceptedTerms: _hasAcceptedTerms.value,
                                    ),
                                  );
                                }
                              }
                          },
                          child: const Text("Continue"),
                        );
                      },
                    ),
                    SizedBox(height: 18.h),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: context.textTheme.bodyLarge
                            ?.copyWith(fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: "Sign in",
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => UtilHelpers.pushTo(RouteNames.signIn),
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _reset() {
    _emailController.clear();
    _firstnameController.clear();
    _lastnameController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    UtilHelpers.killKeyboard();
  }
}
