import 'package:ellipsis_care/src/features/authentication/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/divider.dart';
import '../widgets/oauth_options.dart';
import '../widgets/textfield.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                "Log in",
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Log in to continue using Ellipsis Care",
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 48.h),
              AuthenticationField(
                fieldname: "Email",
                hint: "Input your email",
                controller: _emailController,
              ),
              SizedBox(height: 16.h),
              PasswordField(
                fieldname: "Password",
                hint: "Input your password",
                controller: _passwordController,
              ),
              SizedBox(height: 2.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => UtilHelpers.pushRoute(RouteNames.forgotPassword),
                  child: Text(
                    "Forgot Password?",
                    style:
                        context.textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                bloc: authenticationBloc,
                listener: (context, state) {
                  switch (state) {
                    case AuthenticationPassed():
                      UtilHelpers.pushRoute(RouteNames.dashboard);
                    case AuthenticationFailed(error: var error):
                      UtilHelpers.showAlert(
                          title: "Error", message: "$error");
                    default:
                  }
                },
                builder: (context, state) {
                  return FilledButton(
                    onPressed: switch (state) {
                      LoadingState() => null,
                      _ => () {
                          authenticationBloc.add(
                            SignInEvent(
                                email: _emailController.text,
                                password: _passwordController.text),
                          );
                          // UtilHelpers.pushRoute(RouteNames.dashboard);
                        }
                    },
                    child: const Text("Continue"),
                  );
                },
              ),
              SizedBox(height: 6.h),
              const AuthenticationDivider(),
              SizedBox(height: 6.h),
              const AuthenticationOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
