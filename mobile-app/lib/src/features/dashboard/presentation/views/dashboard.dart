import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/oval.dart';
import 'package:ellipsis_care/src/shared/appbar.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ProfileBar(profileName: "Leonard", showNotifications: true),
          ClipPath(
            clipper: AppClipper(),
            child: Container(
              height: 220,
              width: 247,
              color: AppColors.red,
            ),
          ),
          CustomPaint(
            painter: AppPainter(),
            child: Container(
              height: 220,
              width: 247,
              color: AppColors.red,
            ),
          )
        ],
      ),
    );
  }
}
