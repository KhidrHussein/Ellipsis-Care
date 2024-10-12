import 'dart:async';

import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';

class RecordingWave extends StatefulWidget {
  const RecordingWave({super.key});

  @override
  State<RecordingWave> createState() => _RecordingWaveState();
}

class _RecordingWaveState extends State<RecordingWave> {
  final List<double> _heights = [0.29, 0.6, 1, 0.6, 0.29];
  Timer? _timer;

  @override
  void initState() {
    _startAnimating();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAnimating() {
    _timer = Timer.periodic(Durations.short4, (timer) {
      setState(() {
        _heights.add(_heights.removeAt(0));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: .1.sh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _heights.map(
              (height) {
                return AnimatedContainer(
                  duration: Durations.medium2,
                  width: 18.w,
                  height: .09.sh * height,
                  margin: REdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                );
              },
            ).toList(),
          ),
        ),
        SizedBox(height: 32.h),
        InkWell(
          onTap: () {
            context.read<DashboardBloc>().add(StopRecordingEvent());
          },
          customBorder: const CircleBorder(),
          child: Container(
            width: 76.w,
            height: 76.h,
            decoration: BoxDecoration(
              border: Border.all(width: .5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.stop,
              size: 48,
              color: Colors.redAccent,
            ),
          ),
        )
      ],
    );
  }
}
