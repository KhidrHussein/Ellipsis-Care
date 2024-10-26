import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/audio_player_service.dart';
import 'package:ellipsis_care/core/services/mic_service.dart';
import 'package:ellipsis_care/src/features/dashboard/data/dashboard_repository.dart';

import '../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../core/services/voice_command_service.dart';
import '../../../../../core/utils/locator.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvents, DashboardState> {
  DashboardBloc()
      : _microphoneService = injector<MicrophoneService>(),
        _voiceCommandService = injector<VoiceCommandService>(),
        _dashboardRepository = injector<DashboardRepository>(),
        super(DefaultState()) {
    on<ActivateVoiceCommandEvent>(_activateVoiceCommand);
    on<StartMicrophoneEvent>(_startRecording);
    on<EndMicrophoneEvent>(_stopRecording);
  }

  final VoiceCommandService _voiceCommandService;
  final MicrophoneService _microphoneService;
  final DashboardRepository _dashboardRepository;

  void _activateVoiceCommand(
      ActivateVoiceCommandEvent event, Emitter<DashboardState> handler) async {
    await _voiceCommandService.listenAndConvertToWords();
  }

  void _startRecording(
      StartMicrophoneEvent event, Emitter<DashboardState> handler) async {
    handler.call(StartedRecordingState());

    await _microphoneService.startRecording();
  }

  void _stopRecording(
      EndMicrophoneEvent event, Emitter<DashboardState> handler) async {
    await _microphoneService.stopRecording();

    final filePath = await _microphoneService.stopRecording();

    if (filePath != null) {
      File audioFile = File(filePath);

      final apiResult = await _dashboardRepository.uploadAudio(audioFile);

      if (apiResult.response != null) {
        final audioPlayer = injector<AudioPlayerService>();

        await audioPlayer.playAudio(apiResult.response!.data);

        handler.call(const EndedRecordingState());
      } else {
        // FIXME: Modify to show the appropriate state for a failed api response
        handler.call(const EndedRecordingState());
        final String errorMessage =
            AppExceptions.getErrorMessage(apiResult.exception!);
        handler.call(const EndedRecordingState());
      }
    } else {
      handler.call(const EndedRecordingState());
    }
  }
}
