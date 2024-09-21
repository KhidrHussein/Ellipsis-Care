import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';

typedef OptionMeta = ({
  String icon,
  void Function()? action,
});

final Map<String, OptionMeta> _options = {
  "Notifications": (
    icon: AssetStrings.notificationsIcon,
    action: () {},
  ),
  "Dark Mode": (
    icon: AssetStrings.darkModeIcon,
    action: () {},
  ),
  "Rate App": (
    icon: AssetStrings.rateIcon,
    action: () {},
  ),
  "Share App": (
    icon: AssetStrings.shareIcon,
    action: () {},
  ),
  "Privacy Policy": (
    icon: AssetStrings.privacyPolicyIcon,
    action: () {},
  ),
  "Terms and Conditions": (
    icon: AssetStrings.termsAndConditonsIcon,
    action: () {}
  ),
  "Cookies Policy": (
    icon: AssetStrings.cookiesPolicyIcon,
    action: () {},
  ),
  "Contact": (
    icon: AssetStrings.contactIcon,
    action: () {},
  ),
  "Feedback": (
    icon: AssetStrings.feedbackIcon,
    action: () {},
  ),
  "Logout": (
    icon: AssetStrings.logoutIcon,
    action: () {},
  ),
};

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  final List<String> itemsWithToggleOption = const ['Notifications'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _options.entries
          .map<Widget>((entry) => SettingsTile(
                icon: entry.value.icon,
                onTap: entry.value.action,
                showToggleButton:
                    itemsWithToggleOption.contains(entry.key) ? true : null,
                text: entry.key,
              ))
          .toList(),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String icon;
  final String text;
  final void Function()? onTap;
  final bool? showToggleButton;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.showToggleButton,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(icon),
      title: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
      ),
      onTap: onTap,
      trailing: showToggleButton != null
          ? Switch.adaptive(
              value: showToggleButton ?? false,
              onChanged: (status) {},
            )
          : null,
    );
  }
}
