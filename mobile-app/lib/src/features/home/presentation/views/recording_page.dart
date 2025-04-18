import '../../../../../config/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../widgets/animated_spinner/spinner.dart';
import '../../../../shared/widgets/appbar.dart';

import '../../../../../core/utils/utils.dart';
import '../bloc/home_bloc.dart';

class RecordingPage extends StatelessWidget {
  const RecordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    final recordingState = context.watch<HomeBloc>().state;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileBar(),
            const Spacer(),
            const Spinner(),
            const Spacer(),
            Padding(
              padding: REdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (recordingState.micState == MicrophoneState.paused) {
                        homeBloc.add(ResumeRecordingEvent());
                      } else if (recordingState.micState ==
                          MicrophoneState.resumed) {
                        homeBloc.add(PauseRecordingEvent());
                      }
                    },
                    child: Container(
                      padding: REdgeInsets.all(20),
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: AppColors.pauseIconBgColor,
                      ),
                      child: recordingState.micState == MicrophoneState.paused
                          ? const Icon(
                              Icons.play_arrow,
                              color: AppColors.white,
                            )
                          : AppAssets.icons.home.icPause.svg(),
                    ),
                  ),
                  10.sizedBoxWidth,
                  GestureDetector(
                    onTap: () {
                      homeBloc.add(StopRecordingEvent());
                    },
                    child: Container(
                      padding: REdgeInsets.all(20),
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: AppColors.stopIconBgColor,
                      ),
                      child: AppAssets.icons.home.icCancel.svg(width: 21),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
