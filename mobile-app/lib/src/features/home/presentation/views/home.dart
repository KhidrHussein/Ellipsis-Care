import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:ellipsis_care/src/features/home/presentation/views/not_recording.dart';

import '../../../../shared/appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    return SafeArea(
      child: Column(
        children: [
          const ProfileBar(),
          const Spacer(),
          BlocConsumer<HomeBloc, HomeState>(
            bloc: homeBloc,
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
