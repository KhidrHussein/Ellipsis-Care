import 'user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        children: [
          // IconButton(
          //   onPressed: () => UtilHelpers.pushTo(RouteNames.responseHistory),
          //   icon: const Icon(Icons.menu),
          // ),
          const Spacer(),
          const UserAvatar(radius: 20),
        ],
      ),
    );
  }
}
