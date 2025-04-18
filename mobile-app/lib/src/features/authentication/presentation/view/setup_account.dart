
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:ellipsis_care/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logman/logman.dart';

import '../../../../../config/router/route_names.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/widgets/divider.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/widgets/oauth_options.dart';
import 'package:ellipsis_care/src/shared/widgets/textfield.dart';

class SetupAccount extends StatefulWidget {
  const SetupAccount({super.key});

  @override
  State<SetupAccount> createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Logman.instance.attachOverlay(
        context: context,
        printLogs: false,
        showOverlay: kDebugMode,
      );
    });
  }

  @override
  void dispose() {
    _reset();
    _emailController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthenticationBloc>();
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
                      fieldname: "Email",
                      hint: "Input your email",
                      controller: _emailController,
                      validator: (input) => UtilHelpers.emailValidator(input),
                    ),
                    SizedBox(height: 48.h),
                    BlocConsumer<AuthenticationBloc, AuthenticationState>(
                      listener: (context, blocState) {
                        final String available =
                            "This email is available for registration.";

                        switch (blocState.state) {
                          case ApiState.success:
                            UtilHelpers.showSuccess(blocState.message);

                            if (blocState.message.contains(available)) {
                              UtilHelpers.pushTo(
                                RouteNames.signup,
                                {"email": _emailController.text},
                              );
                              break;
                            }
                            
                            UtilHelpers.pushTo(RouteNames.createPassword);
                            break;

                          case ApiState.failed:
                            UtilHelpers.showError(blocState.error);
                            break;

                          default:
                        }
                      },
                      builder: (context, blocState) {
                        return FilledButton(
                          onPressed: switch (blocState.state) {
                            ApiState.loading => null,
                            _ => () {
                                if (_formKey.currentState!.validate()) {
                                  bloc.add(
                                    CheckIfEmailExistsEvent(
                                      email: _emailController.text,
                                    ),
                                  );
                                }
                              }
                          },
                          child: const Text("Continue"),
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
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
                    const AuthenticationDivider(),
                    const OAuthOptions(),
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
    UtilHelpers.killKeyboard();
  }
}


// husseinharisliat@gmail.com