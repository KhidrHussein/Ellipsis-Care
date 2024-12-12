import 'package:flutter/foundation.dart';
import 'package:logman/logman.dart';

import '../../../../core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/helpers.dart';

import '../../../../config/router/route_names.dart';
import '../../../../core/constants/asset_strings.dart';
import '../../../../core/constants/colors.dart';

part 'bottom_bar_cubit.dart';

class NavigatorShell extends StatefulWidget {
  final Widget child;
  final GoRouterState routerState;

  const NavigatorShell({
    super.key,
    required this.child,
    required this.routerState,
  });

  @override
  State<NavigatorShell> createState() => _NavigatorShellState();
}

class _NavigatorShellState extends State<NavigatorShell> {
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Logman.instance.attachOverlay(
          context: context,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      backgroundColor: switch (widget.routerState.matchedLocation) {
        '/settings' ||
        '/dashboard' =>
          context.themeExtension.dashboardScaffoldColor,
        _ => context.themeData.scaffoldBackgroundColor,
      },
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(.88.sw, (.88.sw * 0.171)),
                  painter: _CustomNavigatorBarPainter(),
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
                      72.sizedBoxWidth,
                      16.horizontalSpace,
                      NavigatorBarItem(
                        iconPath: AssetStrings.dashboard,
                        selectedIcon: AssetStrings.dashboard == state,
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
                // colorFilter: ColorFilter.mode(
                //   switch (selectedIcon) {
                //     true => AppColors.black,
                //     false => AppColors.navigationIconColor,
                //   },
                //   BlendMode.srcIn,
                // ),
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
    Path fillPath = Path();
    fillPath.moveTo(size.width * 0.4995149, size.height * 0.8490492);
    fillPath.cubicTo(
      size.width * 0.5510325,
      size.height * 0.8490492,
      size.width * 0.5927967,
      size.height * 0.5871778,
      size.width * 0.5927967,
      size.height * 0.2641429,
    );
    fillPath.cubicTo(
      size.width * 0.5927967,
      size.height * 0.1373960,
      size.width * 0.6077046,
      0,
      size.width * 0.6293442,
      0,
    );
    fillPath.lineTo(
      size.width * 0.9136640,
      0,
    );
    fillPath.cubicTo(
      size.width * 0.9608076,
      0,
      size.width * 0.9990298,
      size.height * 0.2238571,
      size.width * 0.9990298,
      size.height * 0.5000000,
    );
    fillPath.cubicTo(
      size.width * 0.9990298,
      size.height * 0.7761429,
      size.width * 0.9608076,
      size.height,
      size.width * 0.9136640,
      size.height,
    );
    fillPath.lineTo(
      size.width * 0.08536585,
      size.height,
    );
    fillPath.cubicTo(
      size.width * 0.03821951,
      size.height,
      0,
      size.height * 0.7761429,
      0,
      size.height * 0.5000000,
    );
    fillPath.cubicTo(
      0,
      size.height * 0.2238571,
      size.width * 0.03821951,
      0,
      size.width * 0.08536585,
      0,
    );
    fillPath.lineTo(
      size.width * 0.3696829,
      0,
    );
    fillPath.cubicTo(
      size.width * 0.3913225,
      0,
      size.width * 0.4062304,
      size.height * 0.1373960,
      size.width * 0.4062304,
      size.height * 0.2641429,
    );
    fillPath.cubicTo(
      size.width * 0.4062304,
      size.height * 0.5871778,
      size.width * 0.4479946,
      size.height * 0.8490492,
      size.width * 0.4995149,
      size.height * 0.8490492,
    );
    fillPath.close();

    Paint fillPathPainter = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawPath(fillPath, fillPathPainter);

    Path borderPath = Path();
    borderPath.moveTo(size.width * 0.5900867, size.height * 0.2641429);
    borderPath.cubicTo(
        size.width * 0.5900867,
        size.height * 0.5794476,
        size.width * 0.5493659,
        size.height * 0.8331762,
        size.width * 0.4995149,
        size.height * 0.8331762);
    borderPath.lineTo(size.width * 0.4995149, size.height * 0.8649222);
    borderPath.cubicTo(
        size.width * 0.5527019,
        size.height * 0.8649222,
        size.width * 0.5955068,
        size.height * 0.5949079,
        size.width * 0.5955068,
        size.height * 0.2641429);
    borderPath.lineTo(size.width * 0.5900867, size.height * 0.2641429);
    borderPath.close();
    borderPath.moveTo(size.width * 0.6293442, size.height * 0.01587302);
    borderPath.lineTo(size.width * 0.9136640, size.height * 0.01587302);
    borderPath.lineTo(size.width * 0.9136640, size.height * -0.01587302);
    borderPath.lineTo(size.width * 0.6293442, size.height * -0.01587302);
    borderPath.lineTo(size.width * 0.6293442, size.height * 0.01587302);
    borderPath.close();
    borderPath.moveTo(size.width * 0.9136640, size.height * 0.9841270);
    borderPath.lineTo(size.width * 0.08536585, size.height * 0.9841270);
    borderPath.lineTo(size.width * 0.08536585, size.height * 1.015873);
    borderPath.lineTo(size.width * 0.9136640, size.height * 1.015873);
    borderPath.lineTo(size.width * 0.9136640, size.height * 0.9841270);
    borderPath.close();
    borderPath.moveTo(size.width * 0.08536585, size.height * 0.01587302);
    borderPath.lineTo(size.width * 0.3696829, size.height * 0.01587302);
    borderPath.lineTo(size.width * 0.3696829, size.height * -0.01587302);
    borderPath.lineTo(size.width * 0.08536585, size.height * -0.01587302);
    borderPath.lineTo(size.width * 0.08536585, size.height * 0.01587302);
    borderPath.close();
    borderPath.moveTo(size.width * 0.4995149, size.height * 0.8331762);
    borderPath.cubicTo(
        size.width * 0.4496640,
        size.height * 0.8331762,
        size.width * 0.4089404,
        size.height * 0.5794476,
        size.width * 0.4089404,
        size.height * 0.2641429);
    borderPath.lineTo(size.width * 0.4035203, size.height * 0.2641429);
    borderPath.cubicTo(
        size.width * 0.4035203,
        size.height * 0.5949079,
        size.width * 0.4463279,
        size.height * 0.8649222,
        size.width * 0.4995149,
        size.height * 0.8649222);
    borderPath.lineTo(size.width * 0.4995149, size.height * 0.8331762);
    borderPath.close();
    borderPath.moveTo(size.width * 0.3696829, size.height * 0.01587302);
    borderPath.cubicTo(
        size.width * 0.3794390,
        size.height * 0.01587302,
        size.width * 0.3878428,
        size.height * 0.04676079,
        size.width * 0.3939051,
        size.height * 0.09406984);
    borderPath.cubicTo(
        size.width * 0.3999810,
        size.height * 0.1414749,
        size.width * 0.4035203,
        size.height * 0.2041571,
        size.width * 0.4035203,
        size.height * 0.2641429);
    borderPath.lineTo(size.width * 0.4089404, size.height * 0.2641429);
    borderPath.cubicTo(
        size.width * 0.4089404,
        size.height * 0.1973825,
        size.width * 0.4050298,
        size.height * 0.1279930,
        size.width * 0.3982412,
        size.height * 0.07501317);
    borderPath.cubicTo(
        size.width * 0.3914390,
        size.height * 0.02193730,
        size.width * 0.3815691,
        size.height * -0.01587302,
        size.width * 0.3696829,
        size.height * -0.01587302);
    borderPath.lineTo(size.width * 0.3696829, size.height * 0.01587302);
    borderPath.close();
    borderPath.moveTo(size.width * 0.002710027, size.height * 0.5000000);
    borderPath.cubicTo(
        size.width * 0.002710027,
        size.height * 0.2326238,
        size.width * 0.03971626,
        size.height * 0.01587302,
        size.width * 0.08536585,
        size.height * 0.01587302);
    borderPath.lineTo(size.width * 0.08536585, size.height * -0.01587302);
    borderPath.cubicTo(
        size.width * 0.03672276,
        size.height * -0.01587302,
        size.width * -0.002710027,
        size.height * 0.2150905,
        size.width * -0.002710027,
        size.height * 0.5000000);
    borderPath.lineTo(size.width * 0.002710027, size.height * 0.5000000);
    borderPath.close();
    borderPath.moveTo(size.width * 0.08536585, size.height * 0.9841270);
    borderPath.cubicTo(
        size.width * 0.03971626,
        size.height * 0.9841270,
        size.width * 0.002710027,
        size.height * 0.7673762,
        size.width * 0.002710027,
        size.height * 0.5000000);
    borderPath.lineTo(size.width * -0.002710027, size.height * 0.5000000);
    borderPath.cubicTo(
        size.width * -0.002710027,
        size.height * 0.7849095,
        size.width * 0.03672276,
        size.height * 1.015873,
        size.width * 0.08536585,
        size.height * 1.015873);
    borderPath.lineTo(size.width * 0.08536585, size.height * 0.9841270);
    borderPath.close();
    borderPath.moveTo(size.width * 0.9963198, size.height * 0.5000000);
    borderPath.cubicTo(
        size.width * 0.9963198,
        size.height * 0.7673762,
        size.width * 0.9593117,
        size.height * 0.9841270,
        size.width * 0.9136640,
        size.height * 0.9841270);
    borderPath.lineTo(size.width * 0.9136640, size.height * 1.015873);
    borderPath.cubicTo(
        size.width * 0.9623062,
        size.height * 1.015873,
        size.width * 1.001740,
        size.height * 0.7849095,
        size.width * 1.001740,
        size.height * 0.5000000);
    borderPath.lineTo(size.width * 0.9963198, size.height * 0.5000000);
    borderPath.close();
    borderPath.moveTo(size.width * 0.9136640, size.height * 0.01587302);
    borderPath.cubicTo(
        size.width * 0.9593117,
        size.height * 0.01587302,
        size.width * 0.9963198,
        size.height * 0.2326238,
        size.width * 0.9963198,
        size.height * 0.5000000);
    borderPath.lineTo(size.width * 1.001740, size.height * 0.5000000);
    borderPath.cubicTo(
        size.width * 1.001740,
        size.height * 0.2150905,
        size.width * 0.9623062,
        size.height * -0.01587302,
        size.width * 0.9136640,
        size.height * -0.01587302);
    borderPath.lineTo(size.width * 0.9136640, size.height * 0.01587302);
    borderPath.close();
    borderPath.moveTo(size.width * 0.5955068, size.height * 0.2641429);
    borderPath.cubicTo(
        size.width * 0.5955068,
        size.height * 0.2041571,
        size.width * 0.5990488,
        size.height * 0.1414749,
        size.width * 0.6051220,
        size.height * 0.09406984);
    borderPath.cubicTo(
        size.width * 0.6111843,
        size.height * 0.04676079,
        size.width * 0.6195881,
        size.height * 0.01587302,
        size.width * 0.6293442,
        size.height * 0.01587302);
    borderPath.lineTo(size.width * 0.6293442, size.height * -0.01587302);
    borderPath.cubicTo(
        size.width * 0.6174607,
        size.height * -0.01587302,
        size.width * 0.6075908,
        size.height * 0.02193730,
        size.width * 0.6007886,
        size.height * 0.07501317);
    borderPath.cubicTo(
        size.width * 0.5940000,
        size.height * 0.1279930,
        size.width * 0.5900867,
        size.height * 0.1973825,
        size.width * 0.5900867,
        size.height * 0.2641429);
    borderPath.lineTo(size.width * 0.5955068, size.height * 0.2641429);
    borderPath.close();

    Paint borderPathPainter = Paint()
      ..color = AppColors.bottomBarBorderColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(borderPath, borderPathPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
