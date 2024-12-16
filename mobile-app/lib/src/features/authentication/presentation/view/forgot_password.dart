import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/enums/api_state.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/bloc/auth_bloc.dart';

import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import '../../../../shared/widgets/textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.clear();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthenticationBloc>();

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
              16.verticalSpace,
              Text(
                "Enter your registered number to receive a “How to reset your password” mail",
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
              ),
              48.verticalSpace,
              AppTextField(
                fieldname: "Email Address",
                hint: "Input your email",
                controller: _emailController,
              ),
              36.verticalSpace,
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  switch (state.apiState) {
                    case ApiState.success:
                      UtilHelpers.showAlert(
                          title: "Success", message: state.data);
                      UtilHelpers.pop();
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
                          if (_emailController.text.isNotEmpty) {
                            bloc.add(
                              ForgotPasswordEvent(email: _emailController.text),
                            );
                          }
                          UtilHelpers.killKeyboard();
                        }
                    },
                    child: const Text("Submit"),
                  );
                },
              ),
              28.verticalSpace,
              OutlinedButton(
                onPressed: UtilHelpers.pop,
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
