import 'package:flutter/material.dart';

import 'package:ellipsis_care/core/services/mic_service.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/animated_oval.dart';
import 'package:ellipsis_care/src/shared/appbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const ProfileBar(profileName: "Leonard", showNotifications: true),
          const AnimatedOval(),
          TextButton(
            onPressed: () {
              AudioService.instance.startRecording();
            },
            child: const Text("Start"),
          ),
          TextButton(
            onPressed: () {
              AudioService.instance.stopRecording();
            },
            child: const Text("Stop"),
          )
        ],
      ),
    );
  }
}
