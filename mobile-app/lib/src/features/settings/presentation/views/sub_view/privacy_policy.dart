import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/settings_appbar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            children: [
              SettingsAppbar(title: "Privacy Policy"),
              24.verticalSpace,
              Text(AssetStrings.privacyPolicy),
            ],
          ),
        ),
      ),
    );
  }
}
