import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/config/theme/controller.dart';
import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/section_option.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_group.dart';

import '../../../../../core/constants/colors.dart';
import '../widgets/user_profile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UserProfile(),
            Container(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
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
                      SectionOption(
                        leadingIcon: AssetStrings.profileIcon,
                        optionTitle: "Profile",
                        onPressed: () =>
                            UtilHelpers.pushRoute(RouteNames.profile),
                      ),
                      SectionOption(
                        leadingIcon: AssetStrings.changePasswordIcon,
                        optionTitle: "Change Password",
                        onPressed: () =>
                            UtilHelpers.pushRoute(RouteNames.changePassword),
                      ),
                      // SectionOption(
                      //   leadingIcon: AssetStrings.languageAndVoiceIcon,
                      //   optionTitle: "Language & Voice",
                      //     onPressed: () {},
                      // ),
                      SectionOption(
                        optionTitle: "Dark Mode",
                        hasSwitch: true,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<ThemeCubit>().changeTheme(value);
                          }
                        },
                      ),
                    ],
                  ),
                  SettingsGroup(
                    groupName: "Notification Preferences",
                    options: [
                      SectionOption(
                        leadingIcon: AssetStrings.pushNotificationIcon,
                        optionTitle: "Push Notification",
                        hasSwitch: true,
                        onPressed: () {},
                      ),
                      5.sizedBoxHeight,
                      SectionOption(
                        leadingIcon: AssetStrings.drugIcon,
                        optionTitle: "Medication",
                        hasSwitch: true,
                        onPressed: () {},
                      ),
                      SectionOption(
                        leadingIcon: AssetStrings.foodIcon,
                        optionTitle: "Food",
                        hasSwitch: true,
                        onPressed: () {},
                      ),
                      SectionOption(
                        leadingIcon: AssetStrings.emergencyNotificationIcon,
                        optionTitle: "Emergency",
                        hasSwitch: true,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SettingsGroup(
                    groupName: "More",
                    options: [
                      SectionOption(
                        leadingIcon: AssetStrings.faqIcon,
                        optionTitle: "FAQs",
                        onPressed: () => UtilHelpers.pushRoute(RouteNames.faq),
                      ),
                      SectionOption(
                        leadingIcon: AssetStrings.legalIcon,
                        optionTitle: "Legal",
                        onPressed: () =>
                            UtilHelpers.pushRoute(RouteNames.legal),
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
