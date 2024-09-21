import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderBar extends StatelessWidget {
  const ReminderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:REdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.calendar_badge_plus),
          )
        ],
      ),
    );
  }
}
