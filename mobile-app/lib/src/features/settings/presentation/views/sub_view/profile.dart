import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_appbar.dart';
import 'package:ellipsis_care/src/shared/widgets/textfield.dart';
import 'package:ellipsis_care/src/shared/widgets/user_avatar.dart';

import '../../../../../../core/constants/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
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
              const SettingsAppbar(title: "Profile"),
              20.sizedBoxHeight,
              const UserAvatar(radius: 40),
              8.sizedBoxHeight,
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Edit Photo",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.editPhotoButtonColor,
                  ),
                ),
              ),
              20.sizedBoxHeight,
              AppTextField(
                fieldname: "First Name",
                controller: _firstNameController,
              ),
              20.sizedBoxHeight,
              AppTextField(
                fieldname: "Last Name",
                controller: _lastNameController,
              ),
              20.sizedBoxHeight,
              AppTextField(
                fieldname: "Email",
                controller: _emailController,
              ),
              .29.sh.sizedBoxHeight,
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
