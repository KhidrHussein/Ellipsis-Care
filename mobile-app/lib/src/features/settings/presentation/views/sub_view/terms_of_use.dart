import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/asset_strings.dart';
import '../../widgets/settings_appbar.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            children: [
              SettingsAppbar(title: "Terms of Use"),
              24.verticalSpace,
              Text(AssetStrings.termsOfUse),
            ],
          ),
        ),
      ),
    );
  }
}
