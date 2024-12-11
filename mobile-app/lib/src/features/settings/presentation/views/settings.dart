import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_card_option.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_group.dart';

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
                        svgIcon: AssetStrings.pushNotificationIcon,
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
                        svgIcon: AssetStrings.drugIcon,
                        title: "Medication",
                        initialSwitchValue: state.enabledNotifications,
                      ),
                      SettingCardOptionWithSwitch(
                        svgIcon: AssetStrings.foodIcon,
                        title: "Food",
                        initialSwitchValue: state.enabledNotifications,
                      ),
                      SettingCardOptionWithSwitch(
                        svgIcon: AssetStrings.emergencyNotificationIcon,
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
}
