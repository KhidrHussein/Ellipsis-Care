import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/home/presentation/widgets/animated_spinner/spinner.dart';
import 'package:ellipsis_care/src/shared/widgets/appbar.dart';

import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/utils/enums/microphone_state.dart';
import '../../../../../core/utils/helpers.dart';
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
                          : SvgPicture.asset(AssetStrings.pauseIcon),
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
                      child: SvgPicture.asset(
                        AssetStrings.cancelIcon,
                        width: 21,
                      ),
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
