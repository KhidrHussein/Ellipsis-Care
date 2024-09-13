import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/oval_clipper.dart';

import '../../../../../core/constants/colors.dart';

class AnimatedOval extends StatefulWidget {
  const AnimatedOval({super.key});

  @override
  State<AnimatedOval> createState() => _AnimatedOvalState();
}

class _AnimatedOvalState extends State<AnimatedOval>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      upperBound: 3,
      duration: const Duration(seconds: 3),
    );

    _controller.forward();
    // _controller.repeat();
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
        clipper: OvalClipper(),
        child: Container(
          height: 220.h,
          width: 247.w,
          padding: REdgeInsets.all(10),
          decoration:
              const BoxDecoration(gradient: AppColors.animatedOvalGradient),
          child: ClipPath(
            clipper: OvalClipper(),
            child: Container(
              color: AppColors.white,
              alignment: Alignment.center,
              child: Text("Hi, What can I do for you?".split(" ").join("\n")),
            ),
          ),
        ),
      ),
    );
  }
}
