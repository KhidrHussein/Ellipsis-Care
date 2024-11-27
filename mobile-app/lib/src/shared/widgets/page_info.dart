import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/extensions.dart';

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
          right: 28,
          top: 60,
          child: Container(
            constraints: BoxConstraints(maxWidth: 227.w, minHeight: 36.h),
            padding: REdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: context.themeExtension.homeColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: Text(
              info,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.textTheme.labelMedium?.color!.withOpacity(.5),
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
