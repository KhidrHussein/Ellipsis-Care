import 'package:ellipsis_care/src/features/home/presentation/widgets/animated_spinner/spinner_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/colors.dart';

class Spinner extends StatefulWidget {
  const Spinner({super.key});

  @override
  State<Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      upperBound: 3,
      duration: Duration(seconds: 3),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: ((2 * math.pi) / 3) * _controller.value,
          child: child,
        );
      },
      child: ClipPath(
        clipper: SpinnerClipper(),
        child: Container(
          height: 220.h,
          width: 247.w,
          padding: REdgeInsets.all(10),
          decoration:
              const BoxDecoration(gradient: AppColors.animatedOvalGradient),
          child: ClipPath(
            clipper: SpinnerClipper(),
            child: Container(
              color: AppColors.white,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
