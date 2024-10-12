import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBar extends StatelessWidget {
  final String profileName;
  final bool showNotifications;
  const ProfileBar({
    super.key,
    required this.profileName,
    this.showNotifications = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 20, right: 20, top: 16),
      child: Row(
        children: [
          const CircleAvatar(),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              "Hi, $profileName 👋",
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ).animate().scale(),
          if (showNotifications)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded),
            )
        ],
      ),
    );
  }
}
