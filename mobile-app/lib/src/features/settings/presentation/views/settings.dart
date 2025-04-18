import '../../../../../config/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import '../widgets/settings_card_option.dart';
import '../widgets/settings_group.dart';

import '../bloc/settings_bloc.dart';
import '../widgets/user_profile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();
    final state = context.watch<SettingsBloc>().state;

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
                        svgIcon: AppAssets.icons.settings.icProfile.path,
                   
                        title: "Profile",
                        onPressed: () => UtilHelpers.pushTo(RouteNames.profile),
                      ),
                      SettingCardOption(
                        svgIcon: AppAssets.icons.settings.icChangePassword.path,
                        title: "Change Password",
                        onPressed: () =>
                            UtilHelpers.pushTo(RouteNames.changePassword),
                      ),
                      SettingCardOptionWithSwitch(
                        title: "Dark Mode",
                        initialSwitchValue: state.enabledDarkMode,
                        onChanged: (value) {
                          if (value != null) {
                            bloc.add(UpdateThemeEvent(enableDarkMode: value));
                          }
                        },
                      ),
                    ],
                  ),
                  SettingsGroup(
                    groupName: "Notification Preferences",
                    options: [
                      SettingCardOptionWithSwitch(
                        svgIcon: AppAssets.icons.settings.icPushNotification.path,
                        title: "Push Notification",
                        initialSwitchValue: state.enabledNotifications,
                        onChanged: (value) {
                          if (value != null) {
                            bloc.add(
                              UpdateNotificationPermissionEvent(
                                enableNotifications: value,
                              ),
                            );
                          }
                        },
                      ),
                      5.sizedBoxHeight,
                      SettingCardOptionWithSwitch(
                        svgIcon:  AppAssets.icons.icDrug.path,
                        title: "Medication",
                        initialSwitchValue: state.enabledNotifications,
                        onChanged: (value) {},
                      ),
                      SettingCardOptionWithSwitch(
                        svgIcon: AppAssets.icons.icFood.path,
                        title: "Food",
                        initialSwitchValue: state.enabledNotifications,
                        onChanged: (value) {},
                      ),
                      SettingCardOptionWithSwitch(
                        svgIcon:  AppAssets.icons.settings.icEmergency.path,
                        title: "Emergency",
                        initialSwitchValue: state.enabledLocation,
                        onChanged: (value) {
                          if (value != null) {
                            bloc.add(
                              UpdateLocationPermissionEvent(
                                enableLocation: value,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SettingsGroup(
                    groupName: "More",
                    options: [
                      SettingCardOption(
                        svgIcon:  AppAssets.icons.settings.icFaq.path,
                        title: "FAQs",
                        onPressed: () => UtilHelpers.pushTo(RouteNames.faq),
                      ),
                      SettingCardOption(
                        svgIcon:  AppAssets.icons.settings.icLegal.path,
                        title: "Legal",
                        onPressed: () => UtilHelpers.pushTo(RouteNames.legal),
                      ),
                      SettingCardOption(
                        svgIcon: AppAssets.icons.settings.icSignout.path,
                        title: "Sign Out",
                        onPressed: () => bloc.add(SignOutEvent()),
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
}
