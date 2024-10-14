import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';

class HelpCircle extends StatelessWidget {
  final Uint8List? picture;
  const HelpCircle({super.key, this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      padding: REdgeInsets.all(2),
      decoration:
          const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
      child: picture != null
          ? CircleAvatar(
              radius: 22,
              backgroundImage: MemoryImage(picture!),
            )
          : const CircleAvatar(),
    );
  }
}
