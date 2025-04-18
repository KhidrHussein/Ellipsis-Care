import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/settings_bloc.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../shared/widgets/textfield.dart';
import '../../widgets/settings_appbar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late final TextEditingController _currentPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: REdgeInsets.only(left: 16, right: 16, bottom: 16, top: 30),
          child: Column(
            children: [
              const SettingsAppbar(title: "Change Password"),
              30.sizedBoxHeight,
              PasswordField(
                fieldname: "Current Password",
                controller: _currentPasswordController,
              ),
              20.sizedBoxHeight,
              PasswordField(
                fieldname: "New Password",
                controller: _newPasswordController,
                validator: (newPassword) =>
                    UtilHelpers.passwordValidator(newPassword),
              ),
              20.sizedBoxHeight,
              PasswordField(
                fieldname: "Re-enter New Password",
                controller: _confirmPasswordController,
                validator: (password) => UtilHelpers.confirmPasswordValidator(
                    password,
                    oldPassword: _newPasswordController.text),
              ),
              .42.sh.sizedBoxHeight,
              BlocConsumer<SettingsBloc, SettingsState>(
                listener: (context, blocState) {
                  switch (blocState.state) {
                    case ApiState.success:
                      UtilHelpers.showSuccess(blocState.data);
                      UtilHelpers.pop();
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
                          bool conditions =
                              (_currentPasswordController.text.isNotEmpty &&
                                  _newPasswordController.text ==
                                      _confirmPasswordController.text);
                          if (conditions) {
                            bloc.add(
                              UpdatePasswordEvent(
                                currentPassword:
                                    _currentPasswordController.text,
                                newPassword: _newPasswordController.text,
                                confirmPassword:
                                    _confirmPasswordController.text,
                              ),
                            );
                          }
                          UtilHelpers.killKeyboard();
                        }
                    },
                    child: const Text("Save"),
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
