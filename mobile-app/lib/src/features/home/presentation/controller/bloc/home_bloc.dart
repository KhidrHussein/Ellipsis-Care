import 'dart:io';

import 'package:ellipsis_care/core/api/response/response.dart';
import 'package:ellipsis_care/src/features/home/models/transcribed_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/mic_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/home/data/home_repository.dart';

import '../../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../../core/services/voice_command_service.dart';
import '../../../../../../core/utils/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc()
      : _microphoneService = injector<MicrophoneService>(),
        _voiceCommandService = injector<VoiceCommandService>(),
        _dashboardRepository = injector<HomeRepository>(),
        super(DefaultState()) {
    on<ActivateVoiceCommandEvent>(_activateVoiceCommand);
    on<StartRecordingEvent>(_startRecording);
    on<EndRecordingEvent>(_stopRecording);
  }

  final VoiceCommandService _voiceCommandService;
  final MicrophoneService _microphoneService;
  final HomeRepository _dashboardRepository;

  void _activateVoiceCommand(
      ActivateVoiceCommandEvent event, Emitter<HomeState> handler) async {
    await _voiceCommandService.listenAndConvertToWords();
  }

  void _startRecording(
      StartRecordingEvent event, Emitter<HomeState> handler) async {
    await _microphoneService.startRecording().then((value) {
      handler.call(StartRecordingState());
    });
  }

  void _stopRecording(
      EndRecordingEvent event, Emitter<HomeState> handler) async {
    final filePath = await _microphoneService.stopRecording();

    printLog("${_microphoneService.runtimeType} value: $filePath");

    if (filePath != null) {
      File audioFile = File(filePath);

      final apiResult = await _dashboardRepository.uploadAudio(audioFile);

      if (apiResult.response != null) {
        final state =
            EndRecordingState(transcribedResult: [apiResult.response!]);

        state.printLog();

        handler.call(
          EndRecordingState(transcribedResult: [...?state.transcribedResult]),
        );
      } else {
        final String errorMessage =
            AppExceptions.getErrorMessage(apiResult.exception!);

        "$runtimeType app exception message: $errorMessage".printLog();

        handler.call(const EndRecordingState());
      }
    } else {
      handler.call(const EndRecordingState());
    }
  }
}
