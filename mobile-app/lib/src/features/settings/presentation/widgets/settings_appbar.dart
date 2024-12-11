import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsAppbar extends StatelessWidget {
  final String? title;
  const SettingsAppbar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => UtilHelpers.pop(),
          child: SvgPicture.asset(
            AssetStrings.navigateBackIcon,
            colorFilter: ColorFilter.mode(
              context.textTheme.titleMedium!.color!,
              BlendMode.srcIn,
            ),
          ),
        ),
        if (title != null) ...[
          5.sizedBoxWidth,
          Text(
            title!,
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ]
      ],
    );
  }
}