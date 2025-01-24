import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/enums/api_state.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/bloc/auth_bloc.dart';

import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import '../../../../shared/widgets/textfield.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _reset();
    _newPassword.dispose();
    _confirmPassword.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthenticationBloc>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: REdgeInsets.fromLTRB(16.w, 100.h, 16.w, 32.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create new password",
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                26.verticalSpace,
                Text(
                  "Enter your new password",
                  style: context.textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
                ),
                40.verticalSpace,
                PasswordField(
                  fieldname: "New Password",
                  hint: "Enter your new password",
                  controller: _newPassword,
                  validator: (input) => UtilHelpers.passwordValidator(input),
                ),
                20.verticalSpace,
                PasswordField(
                  fieldname: "Confirm Password",
                  hint: "Confirm your new password",
                  controller: _confirmPassword,
                  validator: (input) => UtilHelpers.confirmPasswordValidator(
                      input,
                      oldPassword: _confirmPassword.text),
                ),
                36.verticalSpace,
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, blocState) {
                    switch (blocState.state) {
                      case ApiState.success:
                        UtilHelpers.showSuccess(blocState.message);

                      case ApiState.failed:
                        UtilHelpers.showError(blocState.error);

                      default:
                        break;
                    }
                  },
                  builder: (context, blocState) {
                    return FilledButton(
                      onPressed: switch (blocState.state) {
                        ApiState.loading => null,
                        _ => () {
                            if (_formKey.currentState!.validate()) {
                              bloc.add(
                                CreatePasswordEvent(
                                  password: _newPassword.text,
                                  confirmPassword: _confirmPassword.text,
                                ),
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
                          TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                  child: const Text("Back"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _reset() {
    _newPassword.clear();
    _confirmPassword.clear();
    UtilHelpers.killKeyboard();
  }
}
