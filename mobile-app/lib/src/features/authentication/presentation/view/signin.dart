import 'package:ellipsis_care/core/utils/enums/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logman/logman.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/divider.dart';
import '../widgets/oauth_options.dart';
import '../../../../shared/widgets/textfield.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Logman.instance.attachOverlay(
        context: context,
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = context.read<AuthenticationBloc>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: REdgeInsets.fromLTRB(16.w, 64.h, 16.w, 32.h),
          child: Form(
            key: _formKey,
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
                AppTextField(
                  fieldname: "Email",
                  hint: "Input your email",
                  controller: _emailController,
                  validator: (email) => UtilHelpers.emailValidator(email),
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
                    onTap: () => UtilHelpers.pushTo(RouteNames.forgotPassword),
                    child: Text(
                      "Forgot Password?",
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontSize: 14.sp),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  bloc: authenticationBloc,
                  listener: (context, state) {
                 
                    switch (state.apiState) {
                      case ApiState.success:
                        UtilHelpers.pushTo(RouteNames.home);
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
                            // if (_formKey.currentState!.validate()) {
                            //   authenticationBloc.add(
                            //     SignInEvent(
                            //       email: _emailController.text,
                            //       password: _passwordController.text,
                            //     ),
                            //   );
                            // }

                               UtilHelpers.pushTo(RouteNames.home);
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
      ),
    );
  }
}
