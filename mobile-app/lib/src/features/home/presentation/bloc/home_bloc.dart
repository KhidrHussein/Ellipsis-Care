import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:ellipsis_care/core/utils/enums/api_state.dart';
import 'package:ellipsis_care/core/utils/enums/microphone_state.dart';
import 'package:ellipsis_care/src/features/home/models/data_from_ai.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../core/services/audio_player_service.dart';
import '../../../../../core/services/mic_service.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import '../../../../../core/utils/locator.dart';
import '../../data/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc()
      : _dashboardRepository = injector<HomeRepository>(),
        _microphoneService = injector<MicrophoneService>(),
        _audioPlayerService = injector<AudioPlayerService>(),
        super(const HomeState()) {
    on<StartRecordingEvent>(_startRecording);
    on<PauseRecordingEvent>(_pauseRecording);
    on<ResumeRecordingEvent>(_resumeRecording);
    on<StopRecordingEvent>(_stopRecording);
    on<ResetEvent>(_reset);
  }

  final HomeRepository _dashboardRepository;
  final MicrophoneService _microphoneService;
  final AudioPlayerService _audioPlayerService;

  void _reset(ResetEvent event, Emitter<HomeState> emit) {
    emit(const HomeState());
  }

  void _startRecording(
      StartRecordingEvent event, Emitter<HomeState> emit) async {
    await _microphoneService.startRecording();
    emit(
      state.copyWith(micState: MicrophoneState.recording),
    );
  }

  void _pauseRecording(
      PauseRecordingEvent event, Emitter<HomeState> emit) async {
    await _microphoneService.pauseRecording();
    emit(
      state.copyWith(micState: MicrophoneState.paused),
    );
  }

  void _resumeRecording(
      ResumeRecordingEvent event, Emitter<HomeState> emit) async {
    await _microphoneService.resumeRecording();
    emit(
      state.copyWith(micState: MicrophoneState.resumed),
    );
  }

  void _stopRecording(StopRecordingEvent event, Emitter<HomeState> emit) async {
    final path = await _microphoneService.stopRecording();
    emit(state.copyWith(micState: MicrophoneState.stopped));
    UtilHelpers.pop();

    if (path == null) {
      emit(
        state.copyWith(error: "No audio file path provided."),
      );
      return;
    }

    final File audioFile = File(path);
    if (!audioFile.existsSync()) {
      emit(
        state.copyWith(error: "Audio file does not exist."),
      );
      return;
    }

    emit(
      state.copyWith(apiState: ApiState.loading),
    );

    try {
      final repoResponse = await _dashboardRepository.uploadAudio(audioFile);

      repoResponse.fold(
        (dataFromAi) {
          _playAudio(dataFromAi.pathToAudiFile);
          _emitData(dataFromAi, emit);
        },
        (exception) {
          final errorMessage = AppExceptions.getErrorMessage(exception);
          emit(
            state.copyWith(apiState: ApiState.failed, error: errorMessage),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(apiState: ApiState.failed, error: "$e"),
      );
    }
  }

  void _emitData(DataFromAI data, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        apiState: ApiState.success,
        aiResponses: [...state.aiResponses, data],
      ),
    );
  }

  void _playAudio(String file) async {
    await _audioPlayerService.playAudio(DeviceFileSource(file));
  }

  @override
  void onTransition(Transition<HomeEvents, HomeState> transition) {
    super.onTransition(transition);
    "$runtimeType $transition".printLog();
  }
}
