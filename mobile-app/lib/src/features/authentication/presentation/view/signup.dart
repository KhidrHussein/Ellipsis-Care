import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/widgets/divider.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/widgets/oauth_options.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/widgets/textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final ValueNotifier<bool> _canContinue = ValueNotifier(false);
  final ValueNotifier<bool> _hasAcceptedTerms = ValueNotifier(false);
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailKey.currentState?.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              ValueListenableBuilder(
                valueListenable: _canContinue,
                builder: (context, value, _) {
                  return AnimatedCrossFade(
                    firstChild: _first(),
                    secondChild: _second(),
                    firstCurve: Curves.easeOut,
                    secondCurve: Curves.easeOut,
                    crossFadeState: value
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: Durations.long2,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _first() {
    return Form(
      key: _emailKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          AuthenticationField(
            fieldname: "Email",
            hint: "Input your email",
            controller: _emailController,
            validator: (input) => UtilHelpers.emailValidator(input),
          ),
          SizedBox(height: 48.h),
          FilledButton(
            onPressed: () {
              if (_emailKey.currentState!.validate()) {
                _canContinue.value = true;
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
          const AuthenticationOptions(isNewUser: true),
        ],
      ),
    );
  }

  Widget _second() {
    final authenticationBloc = context.read<AuthenticationBloc>();

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          AuthenticationField(
            fieldname: "First name",
            hint: "Input your first name",
            controller: _firstnameController,
            validator: (input) => UtilHelpers.nameValidator(input?.trim()),
          ),
          SizedBox(height: 16.h),
          AuthenticationField(
            fieldname: "Last name",
            hint: "Input your last name",
            controller: _lastnameController,
            validator: (input) => UtilHelpers.nameValidator(input?.trim()),
          ),
          SizedBox(height: 16.h),
          PasswordField(
            fieldname: "Password",
            hint: "Enter your password",
            controller: _passwordController,
            validator: (input) => UtilHelpers.passwordValidator(input),
          ),
          SizedBox(height: 16.h),
          PasswordField(
            fieldname: "Confirm password",
            hint: "Re-enter your password",
            controller: _confirmPasswordController,
            validator: (input) => UtilHelpers.confirmPasswordValidator(
                input, _passwordController.text),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: _hasAcceptedTerms,
                builder: (context, value, child) {
                  return Checkbox(
                    value: value,
                    onChanged: (status) => _hasAcceptedTerms.value = status!,
                  );
                },
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
          BlocConsumer<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            listener: (context, state) {
              switch (state) {
                case AuthenticationPassed():
                  UtilHelpers.pushRoute(RouteNames.verifyEmail);
                case AuthenticationFailed(error: var error):
                  UtilHelpers.showAlert(title: "Error", message: "$error");
                default:
              }
            },
            builder: (context, state) {
              return FilledButton(
                onPressed: switch (state) {
                  LoadingState() => null,
                  _ => () {
                      if (_formKey.currentState!.validate()) {
                        authenticationBloc.add(
                          SignUpEvent(
                            email: _emailController.text,
                            firstName: _firstnameController.text,
                            lastName: _lastnameController.text,
                            password: _passwordController.text,
                            hasAcceptedTerms: _hasAcceptedTerms.value,
                          ),
                        );
                      }

                      // UtilHelpers.pushRoute(RouteNames.verifyEmail);
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
      ),
    );
  }
}
