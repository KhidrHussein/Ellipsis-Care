import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/enums/api_state.dart';
import '../../../../../../core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_appbar.dart';
import 'package:ellipsis_care/src/shared/widgets/textfield.dart';
import 'package:ellipsis_care/src/shared/widgets/user_avatar.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../shared/user_bloc/user_bloc.dart';

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
    final bloc = context.read<UserBloc>()..add(GetUserEvent());

    _firstNameController =
        TextEditingController(text: bloc.state.user?.firstname);
    _lastNameController =
        TextEditingController(text: bloc.state.user?.lastname);
    _emailController = TextEditingController(text: bloc.state.user?.email);
  }

  @override
  void dispose() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.read<SettingsBloc>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: REdgeInsets.only(left: 16, right: 16, bottom: 16, top: 30),
          child: Column(
            children: [
              const SettingsAppbar(title: "Profile"),
             
              const UserAvatar(radius: 40),
              8.sizedBoxHeight,
              GestureDetector(
                onTap: () => context
                    .read<SettingsBloc>()
                    .add(UpdateProfilePictureEvent()),
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
              .3.sh.sizedBoxHeight,
              BlocConsumer<SettingsBloc, SettingsState>(
                listener: (context, state) {
                  switch (state.apiState) {
                    case ApiState.success:
                      UtilHelpers.showAlert(
                          title: "Success", message: "Profile updated");
                      UtilHelpers.pop();
                      break;
                    case ApiState.failed:
                      UtilHelpers.showAlert(
                          title: "Error", message: state.error);
                      break;
                    default:
                  }
                },
                builder: (context, state) {
                  return FilledButton(
                    onPressed: switch (state.apiState) {
                      ApiState.loading => null,
                      _ => () {
                          bool conditions = (_emailController.text.isNotEmpty &&
                              _firstNameController.text.isNotEmpty &&
                              _lastNameController.text.isNotEmpty);
                          if (conditions) {
                            settingsBloc.add(
                              UpdateProfileEvent(
                                email: _emailController.text,
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
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
