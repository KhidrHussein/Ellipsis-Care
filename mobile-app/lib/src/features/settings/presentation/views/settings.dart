import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/services/storage_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_card_option.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_group.dart';

import '../../../../shared/controller/app_session_bloc/app_session_bloc.dart';
import '../../../../../core/utils/locator.dart';
import '../widgets/user_profile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final appSessionState = context.watch<AppSessionBloc>().state;
    final appSessionBloc = context.read<AppSessionBloc>();

    return SafeArea(
      child: SingleChildScrollView(
        padding: REdgeInsets.only(top: 30),
        child: Column(
          children: [
            const UserProfile(),
            Container(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: context.themeData.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
              ),
              child: Column(
                children: [
                  SettingsGroup(
                    groupName: "Personal",
                    options: [
                      SettingCardOption(
                        svgIcon: AssetStrings.profileIcon,
                        title: "Profile",
                        onPressed: () => UtilHelpers.pushTo(RouteNames.profile),
                      ),
                      SettingCardOption(
                        svgIcon: AssetStrings.changePasswordIcon,
                        title: "Change Password",
                        onPressed: () =>
                            UtilHelpers.pushTo(RouteNames.changePassword),
                      ),
                      SettingCardOptionWithSwitch(
                        title: "Dark Mode",
                        initialSwitchValue:
                            appSessionState.appSession!.hasEnabledDarkMode,
                        onChanged: (value) {
                          if (value != null) {
                            appSessionBloc.add(
                              EnableDarkModeEvent(darkModeIsEnabled: value),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SettingsGroup(
                    groupName: "Notification Preferences",
                    options: [
                      SettingCardOptionWithSwitch(
                        svgIcon: AssetStrings.pushNotificationIcon,
                        title: "Push Notification",
                        initialSwitchValue: true,
                        onChanged: (value) {},
                      ),
                      5.sizedBoxHeight,
                      SettingCardOptionWithSwitch(
                        svgIcon: AssetStrings.drugIcon,
                        title: "Medication",
                        initialSwitchValue: true,
                        onChanged: (value) {},
                      ),
                      SettingCardOptionWithSwitch(
                        svgIcon: AssetStrings.foodIcon,
                        title: "Food",
                        initialSwitchValue: true,
                        onChanged: (value) {},
                      ),
                      SettingCardOptionWithSwitch(
                        svgIcon: AssetStrings.emergencyNotificationIcon,
                        title: "Emergency",
                        initialSwitchValue: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  SettingsGroup(
                    groupName: "More",
                    options: [
                      SettingCardOption(
                        svgIcon: AssetStrings.faqIcon,
                        title: "FAQs",
                        onPressed: () => UtilHelpers.pushTo(RouteNames.faq),
                      ),
                      SettingCardOption(
                        svgIcon: AssetStrings.legalIcon,
                        title: "Legal",
                        onPressed: () => UtilHelpers.pushTo(RouteNames.legal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _updateUserData(bool value) async {
  //   final userdata = await injector<StorageService>().getUserData();
  //   userdata!.enableDarkMode = value;
  //   await userdata.save();
  // }
}
