import '../../../config/router/route_names.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/asset_strings.dart';
import '../../../core/constants/colors.dart';

part 'cubit.dart';

class NavigatorShell extends StatelessWidget {
  final Widget child;
  final GoRouterState routerState;

  const NavigatorShell({
    super.key,
    required this.child,
    required this.routerState,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor: routerState.matchedLocation == '/emergency'
          ? AppColors.emergencyBackgroundColor
          : AppColors.white,
      bottomNavigationBar: const CustomNavigatorBar(),
    );
  }
}

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationRowCubit, String>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: SizedBox(
            height: .1.sh,
            width: 1.sw,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: (.1.sh - 72.h),
                  left: (1.sw - .92.sw) / 2,
                  right: (1.sw - .93.sw) / 2,
                  child: CustomPaint(
                    size: Size(.93.sw, 63.h),
                    painter: _CustomNavigatorBarPainter(),
                    child: Container(),
                  ),
                ),
                Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavigatorBarItem(
                        iconPath: AssetStrings.home,
                        selectedIcon: AssetStrings.home == state,
                      ),
                      24.horizontalSpace,
                      NavigatorBarItem(
                        iconPath: AssetStrings.reminders,
                        selectedIcon: AssetStrings.reminders == state,
                      ),
                      16.horizontalSpace,
                      const SizedBox(width: 64),
                      16.horizontalSpace,
                      NavigatorBarItem(
                        iconPath: AssetStrings.charts,
                        selectedIcon: AssetStrings.charts == state,
                      ),
                      24.horizontalSpace,
                      NavigatorBarItem(
                        iconPath: AssetStrings.settings,
                        selectedIcon: AssetStrings.settings == state,
                      ),
                    ],
                  ),
                ),
  
                Positioned(
              
                  bottom: 18.h,
                  child: NavigatorBarItem(
                    iconPath: AssetStrings.emergency,
                    selectedIcon: AssetStrings.emergency == state,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NavigatorBarItem extends StatelessWidget {
  final String iconPath;
  final bool selectedIcon;

  const NavigatorBarItem({
    super.key,
    required this.iconPath,
    required this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<NavigationRowCubit>().goToRoute(iconPath),
      child: Padding(
        padding: REdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath == AssetStrings.emergency)
              Container(
                height: 54.h,
                width: 54.w,
                padding: REdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: switch (selectedIcon) {
                    true => AppColors.black,
                    false => AppColors.red,
                  },
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  iconPath,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              )
            else
              SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.h,
                colorFilter: ColorFilter.mode(
                  switch (selectedIcon) {
                    true => AppColors.black,
                    false => AppColors.navigationIconColor,
                  },
                  BlendMode.srcIn,
                ),
              ),
            if (selectedIcon && iconPath != AssetStrings.emergency)
              Container(
                width: 6.w,
                height: 6.w,
                margin: REdgeInsets.only(top: 3),
                decoration: const BoxDecoration(
                  color: AppColors.black,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CustomNavigatorBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_1 = Path();
    path_1.moveTo(184.321, 53.4901);
    path_1.cubicTo(203.331, 53.4901, 218.742, 36.9922, 218.742, 16.641);
    path_1.cubicTo(218.742, 8.65595, 224.243, 0, 232.228, 0);
    path_1.lineTo(337.142, 0);
    path_1.cubicTo(354.538, 0, 368.642, 14.103, 368.642, 31.5);
    path_1.cubicTo(368.642, 48.897, 354.538, 63, 337.142, 63);
    path_1.lineTo(31.5, 63);
    path_1.cubicTo(14.103, 63, 0, 48.897, 0, 31.5);
    path_1.cubicTo(0, 14.103, 14.103, 0, 31.5, 0);
    path_1.lineTo(136.413, 0);
    path_1.cubicTo(144.398, 0, 149.899, 8.65595, 149.899, 16.641);
    path_1.cubicTo(149.899, 36.9922, 165.31, 53.4901, 184.321, 53.4901);
    path_1.close();

    Paint pathOneFill = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;
    canvas.drawPath(path_1, pathOneFill);

    Path path = Path();
    path.moveTo(217.742, 16.641);
    path.cubicTo(217.742, 36.5052, 202.716, 52.4901, 184.321, 52.4901);
    path.lineTo(184.321, 54.4901);
    path.cubicTo(203.947, 54.4901, 219.742, 37.4792, 219.742, 16.641);
    path.lineTo(217.742, 16.641);
    path.close();
    path.moveTo(232.228, 1);
    path.lineTo(337.142, 1);
    path.lineTo(337.142, -1);
    path.lineTo(232.228, -1);
    path.lineTo(232.228, 1);
    path.close();
    path.moveTo(337.142, 62);
    path.lineTo(31.5, 62);
    path.lineTo(31.5, 64);
    path.lineTo(337.142, 64);
    path.lineTo(337.142, 62);
    path.close();
    path.moveTo(31.5, 1);
    path.lineTo(136.413, 1);
    path.lineTo(136.413, -1);
    path.lineTo(31.5, -1);
    path.lineTo(31.5, 1);
    path.close();
    path.moveTo(184.321, 52.4901);
    path.cubicTo(165.926, 52.4901, 150.899, 36.5052, 150.899, 16.641);
    path.lineTo(148.899, 16.641);
    path.cubicTo(148.899, 37.4792, 164.695, 54.4901, 184.321, 54.4901);
    path.lineTo(184.321, 52.4901);
    path.close();
    path.moveTo(136.413, 1);
    path.cubicTo(140.013, 1, 143.114, 2.94593, 145.351, 5.9264);
    path.cubicTo(147.593, 8.91292, 148.899, 12.8619, 148.899, 16.641);
    path.lineTo(150.899, 16.641);
    path.cubicTo(150.899, 12.4351, 149.456, 8.06356, 146.951, 4.72583);
    path.cubicTo(144.441, 1.38205, 140.799, -1, 136.413, -1);
    path.lineTo(136.413, 1);
    path.close();
    path.moveTo(1, 31.5);
    path.cubicTo(1, 14.6553, 14.6553, 1, 31.5, 1);
    path.lineTo(31.5, -1);
    path.cubicTo(13.5507, -1, -1, 13.5507, -1, 31.5);
    path.lineTo(1, 31.5);
    path.close();
    path.moveTo(31.5, 62);
    path.cubicTo(14.6553, 62, 1, 48.3447, 1, 31.5);
    path.lineTo(-1, 31.5);
    path.cubicTo(-1, 49.4493, 13.5507, 64, 31.5, 64);
    path.lineTo(31.5, 62);
    path.close();
    path.moveTo(367.642, 31.5);
    path.cubicTo(367.642, 48.3447, 353.986, 62, 337.142, 62);
    path.lineTo(337.142, 64);
    path.cubicTo(355.091, 64, 369.642, 49.4493, 369.642, 31.5);
    path.lineTo(367.642, 31.5);
    path.close();
    path.moveTo(337.142, 1);
    path.cubicTo(353.986, 1, 367.642, 14.6553, 367.642, 31.5);
    path.lineTo(369.642, 31.5);
    path.cubicTo(369.642, 13.5507, 355.091, -1, 337.142, -1);
    path.lineTo(337.142, 1);
    path.close();
    path.moveTo(219.742, 16.641);
    path.cubicTo(219.742, 12.8619, 221.049, 8.91292, 223.29, 5.9264);
    path.cubicTo(225.527, 2.94593, 228.628, 1, 232.228, 1);
    path.lineTo(232.228, -1);
    path.cubicTo(227.843, -1, 224.201, 1.38205, 221.691, 4.72583);
    path.cubicTo(219.186, 8.06356, 217.742, 12.4351, 217.742, 16.641);
    path.lineTo(219.742, 16.641);
    path.close();

    Paint pathPaint = Paint()
      ..color = AppColors.navigatiorBarBorderColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
