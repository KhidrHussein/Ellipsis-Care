import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/enums/api_state.dart';

import '../../../../../core/enums/microphone_state.dart';
import '../../../../../core/utils/helpers.dart';
import '../bloc/home_bloc.dart';
import 'not_recording.dart';
import 'prompt_responses.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.micState == MicrophoneState.recording) {
            UtilHelpers.pushTo(RouteNames.recording);
          }
        },
        builder: (context, state) {
          if (state.apiState == ApiState.success) {
            return PromptResponses(responses: state.responses);
          }
          if (state.apiState == ApiState.failed && state.error.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.error),
                TextButton.icon(
                  onPressed: () {
                    context.read<HomeBloc>().add(ResetEvent());
                  },
                  icon: const Icon(Icons.redo),
                  label: const Text("Reset"),
                )
              ],
            );
          }
          if (state.apiState == ApiState.loading && state.error.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const NotRecording();
          }
        },
      ),
    );
  }
}
