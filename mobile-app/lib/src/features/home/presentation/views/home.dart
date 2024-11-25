import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/src/features/home/models/transcribed_response.dart';
import 'package:ellipsis_care/src/features/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:ellipsis_care/src/features/home/presentation/views/not_recording.dart';
import 'package:ellipsis_care/src/features/home/presentation/views/prompt_responses.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return switch (state) {
            InitialState() => const NotRecording(),
            LoadingState() => const Center(child: CircularProgressIndicator()),
            UploadToAISuccessful() => PromptResponses(
                responses: homeBloc.state as List<TranscribedResponse>),
            UploadToAIFailed(:String? error) => Text("$error"),
          };
        },
      ),
    );
  }
}
