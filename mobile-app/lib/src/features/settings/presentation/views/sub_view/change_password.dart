import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              .43.sh.sizedBoxHeight,
              FilledButton(
                onPressed: () {},
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
