import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';

import '../../../../shared/appbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardBloc = context.read<DashboardBloc>();

    return SafeArea(
      child: Column(
        children: [
          const ProfileBar(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  dashboardBloc.add(ActivateVoiceCommandEvent());
                },
                child: const Text("Voice Command System"),
              ),
              20.sizedBoxWidth,
              ElevatedButton(
                onPressed: () {
                  dashboardBloc.add(StartMicrophoneEvent());
                },
                child: const Text("Record Voice"),
              ),
            ],
            
          ),
           ElevatedButton(
            onPressed: () {
              dashboardBloc.add(EndMicrophoneEvent());
            },
            child: const Text("End Voice"),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
