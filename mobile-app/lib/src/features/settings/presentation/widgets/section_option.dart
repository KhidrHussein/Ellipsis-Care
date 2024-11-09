import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../../../../core/constants/colors.dart';

class SectionOption extends StatefulWidget {
  final String? leadingIcon;
  final String optionTitle;
  final bool hasSwitch;
  final void Function(bool?)? onChanged;
  final VoidCallback? onPressed;

  const SectionOption({
    super.key,
    this.leadingIcon,
    required this.optionTitle,
    this.hasSwitch = false,
    this.onPressed,
    this.onChanged,
  });

  @override
  State<SectionOption> createState() => _SectionOptionState();
}

class _SectionOptionState extends State<SectionOption> {
  final ValueNotifier<bool> _switchValue = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.settingsGroupBgColor,
        ),
        child: Row(
          children: [
            if (widget.leadingIcon != null) ...[
              SvgPicture.asset(widget.leadingIcon!),
              10.sizedBoxWidth,
            ],
            Text(
              widget.optionTitle,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
              ),
            ),
            const Spacer(),
            if (widget.hasSwitch)
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
            else
              const Icon(
                Icons.keyboard_arrow_right,
                size: 24,
              )
          ],
        ),
      ),
    );
  }
}
