import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/views/not_recording.dart';

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
          BlocConsumer<DashboardBloc, DashboardState>(
            bloc: dashboardBloc,
            listener: (context, state) {
              switch (state) {
                case StartRecordingState():
                  UtilHelpers.pushRoute(RouteNames.recording);
                  break;
                default:
              }
            },
            builder: (context, state) => const NotRecording(),
          ),
        ],
      ),
    );
  }
}
