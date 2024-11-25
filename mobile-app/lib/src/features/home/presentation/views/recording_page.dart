import 'package:ellipsis_care/src/features/home/presentation/controller/microphone_bloc/mic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/home/presentation/widgets/animated_spinner/spinner.dart';
import 'package:ellipsis_care/src/shared/appbar.dart';

import '../../../../../core/utils/helpers.dart';
import '../controller/home_bloc/home_bloc.dart';

class RecordingPage extends StatelessWidget {
  const RecordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    final micBloc = context.read<MicrophoneBloc>();

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
                  BlocConsumer<MicrophoneBloc, MicrophoneState>(
                    bloc: micBloc,
                    listener: (context, state) {
                      if (state case RecordingStopped()) {
                        UtilHelpers.popRoute();
                        homeBloc.add(
                          UploadAudioToAIEvent(audioFilePath: state.filePath),
                        );
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: switch (state) {
                          RecordingPaused() => () {
                              micBloc.add(ResumeRecordingEvent());
                            },
                          RecordingResumed() => () {
                              micBloc.add(PauseRecordingEvent());
                            },
                          _ => null
                        },
                        child: Container(
                          padding: REdgeInsets.all(20),
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColors.pauseIconBgColor,
                          ),
                          child: switch (state) {
                            RecordingPaused() => const Icon(
                                Icons.play_arrow,
                                color: AppColors.white,
                              ),
                            _ => SvgPicture.asset(AssetStrings.pauseIcon),
                          },
                        ),
                      );
                    },
                  ),
                  10.sizedBoxWidth,
                  GestureDetector(
                    onTap: () => micBloc.add(StopRecordingEvent()),
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
