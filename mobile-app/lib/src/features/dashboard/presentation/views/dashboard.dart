import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/animated_oval.dart';
import 'package:ellipsis_care/src/shared/appbar.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          ProfileBar(profileName: "Leonard", showNotifications: true),
          AnimatedOval(),
        ],
      ),
    );
  }
}
