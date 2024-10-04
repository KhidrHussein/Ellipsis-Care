import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/src/features/dashboard/presentation/bloc/bloc.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/ai_response.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/recording_wave.dart';
import 'package:ellipsis_care/src/shared/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const ProfileBar(profileName: "Leonard", showNotifications: true),
          const Spacer(),
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return switch (state) {
                InitialState() => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<DashboardBloc>()
                              .add(StartRecordingEvent());
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
                  ),
                LoadingState() => const CircularProgressIndicator.adaptive(),
                RecordingState() => const RecordingWave(),
                NotRecordingState(aiResponse: var a) => AiResponse(response: a),
              };
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
