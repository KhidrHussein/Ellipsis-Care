import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../core/constants/colors.dart';

class PageInfo extends StatelessWidget {
  final String info;
  PageInfo({super.key, required this.info});

  final OverlayPortalController _controller = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _controller,
      overlayChildBuilder: (context) {
        return Positioned(
          right: 32,
          top: 96,
          child: Container(
            constraints: BoxConstraints(maxWidth: 227.w, minHeight: 36.h),
            padding: REdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.homeBtnColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: Text(
              info,
              style: context.textTheme.labelMedium?.copyWith(
                color: AppColors.black.withOpacity(.5),
              ),
            ),
          ),
        );
      },
      child: IconButton(
        onPressed: _controller.toggle,
        icon: const Icon(Icons.info_outline),
      ),
    );
  }
}
