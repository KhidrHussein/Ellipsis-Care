import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_card_option.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_appbar.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/router/route_names.dart';
import '../../../../../../core/constants/asset_strings.dart';

class Legal extends StatelessWidget {
  const Legal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            children: [
              const SettingsAppbar(title: "Legal"),
              20.verticalSpace,
              SettingsGroup(
                options: [
                  SettingCardOption(
                    svgIcon: AssetStrings.privacyPolicyIcon,
                    title: "Privacy Policy",
                    onPressed: () =>
                        UtilHelpers.pushRoute(RouteNames.privacyPolicy),
                  ),
                  SettingCardOption(
                    title: "Terms of Use",
                    onPressed: () =>
                        UtilHelpers.pushRoute(RouteNames.termsOfUse),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
