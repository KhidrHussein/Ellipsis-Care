import 'package:flutter/material.dart';

import '../../core/constants/asset_strings.dart';
import '../../core/constants/colors.dart';

class UserAvatar extends StatelessWidget {
  final double radius;
  const UserAvatar({super.key, this.radius = 15});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: radius,
      backgroundColor: AppColors.white,
      backgroundImage: const AssetImage(AssetStrings.logo),
    );
  }
}
