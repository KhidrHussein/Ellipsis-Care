import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/src/features/dashboard/presentation/bloc/bloc.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/ai_response.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/animated_oval.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/recording_wave.dart';
import 'package:ellipsis_care/src/shared/appbar.dart';

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
                InitialState() => const AnimatedOval(),
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
