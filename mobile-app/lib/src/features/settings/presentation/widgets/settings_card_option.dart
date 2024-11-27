import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/extensions.dart';

class SettingCardOption extends StatelessWidget {
  final String title;
  final String? svgIcon;
  final VoidCallback? onPressed;

  const SettingCardOption({
    super.key,
    this.svgIcon,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
          color: context.themeExtension.settingsCardColor,
        ),
        child: Row(
          children: [
            if (svgIcon != null) ...[
              SvgPicture.asset(
                svgIcon!,
                colorFilter: ColorFilter.mode(
                  context.textTheme.bodyMedium!.color!,
                  BlendMode.srcIn,
                ),
              ),
              10.sizedBoxWidth,
            ],
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
              ),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right, size: 24)
          ],
        ),
      ),
    );
  }
}

class SettingCardOptionWithSwitch extends StatefulWidget {
  final String title;
  final String? svgIcon;
  final bool initialSwitchValue;
  final void Function(bool?)? onChanged;

  const SettingCardOptionWithSwitch({
    super.key,
    this.svgIcon,
    this.onChanged,
    required this.initialSwitchValue,
    required this.title,
  });

  @override
  State<SettingCardOptionWithSwitch> createState() =>
      _SettingCardOptionWithSwitchState();
}

class _SettingCardOptionWithSwitchState
    extends State<SettingCardOptionWithSwitch> {
  late final ValueNotifier<bool> _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = ValueNotifier(widget.initialSwitchValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: context.themeExtension.settingsCardColor,
      ),
      child: Row(
        children: [
          if (widget.svgIcon != null) ...[
            SvgPicture.asset(
              widget.svgIcon!,
              colorFilter: ColorFilter.mode(
                context.textTheme.bodyMedium!.color!,
                BlendMode.srcIn,
              ),
            ),
            10.sizedBoxWidth,
          ],
          Text(
            widget.title,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
            ),
          ),
          const Spacer(),
          ValueListenableBuilder(
            valueListenable: _switchValue,
            builder: (context, value, _) {
              return ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 28),
                child: Switch.adaptive(
                  value: value,
                  onChanged: (value) {
                    _switchValue.value = value;
                    widget.onChanged!(value);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
