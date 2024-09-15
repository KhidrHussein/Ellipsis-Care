import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/bloc/bloc.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/oval_clipper.dart';

import '../../../../../core/constants/asset_strings.dart';
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
      lowerBound: 0,
      upperBound: 2 * math.pi,
      duration: const Duration(seconds: 3),
    );
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(angle: _controller.value, child: child);
          },
          child: ClipPath(
            clipper: OvalClipper(),
            child: Container(
              height: .27.sh,
              width: .64.sw,
              padding: REdgeInsets.all(10),
              decoration:
                  const BoxDecoration(gradient: AppColors.animatedOvalGradient),
              child: ClipPath(
                clipper: OvalClipper(),
                child: Container(
                  color: AppColors.white,
                  padding: REdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome to Ellipsis",
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: AssetStrings.kronaOne,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 72.h),
        InkWell(
          onTap: () {
            context.read<DashboardBloc>().add(StartRecordingEvent());
          },
          customBorder: const CircleBorder(),
          child: Container(
            width: 76.w,
            height: 76.h,
            decoration: BoxDecoration(
              border: Border.all(width: .5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.mic_none, size: 48),
          ),
        ),
      ],
    );
  }
}
