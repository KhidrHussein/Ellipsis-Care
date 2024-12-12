import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/file_storage_service.dart';
import 'package:ellipsis_care/core/enums/api_state.dart';
import 'package:ellipsis_care/core/enums/file_storage_type.dart';
import 'package:ellipsis_care/core/enums/microphone_state.dart';
import 'package:ellipsis_care/src/features/home/models/home_response.dart';

import '../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../core/services/audio_player_service.dart';
import '../../../../../core/services/mic_service.dart';

import '../../../../../core/utils/helpers.dart';
import '../../../../../core/utils/injector.dart';
import '../../data/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<StartRecordingEvent>(_startRecording);
    on<PauseRecordingEvent>(_pauseRecording);
    on<ResumeRecordingEvent>(_resumeRecording);
    on<StopRecordingEvent>(_stopRecording);
    on<ResetEvent>(_reset);
  }

  final HomeRepository _dashboardRepository = injector<HomeRepository>();
  final MicrophoneService _microphoneService = injector<MicrophoneService>();
  final FileStorageService _fileStorageService = injector<FileStorageService>();
  final AudioPlayerService _audioPlayerService = injector<AudioPlayerService>();

  void _reset(ResetEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        error: "",
        apiState: ApiState.none,
        micState: MicrophoneState.none,
        responses: state.responses,
      ),
    );
  }

  void _startRecording(
      StartRecordingEvent event, Emitter<HomeState> emit) async {
    await _microphoneService.startRecording();
    emit(state.copyWith(micState: MicrophoneState.recording));
  }

  void _pauseRecording(
      PauseRecordingEvent event, Emitter<HomeState> emit) async {
    await _microphoneService.pauseRecording();
    emit(state.copyWith(micState: MicrophoneState.paused));
  }

  void _resumeRecording(
      ResumeRecordingEvent event, Emitter<HomeState> emit) async {
    await _microphoneService.resumeRecording();
    emit(state.copyWith(micState: MicrophoneState.resumed));
  }

  void _stopRecording(StopRecordingEvent event, Emitter<HomeState> emit) async {
    final path = await _microphoneService.stopRecording();
    emit(state.copyWith(micState: MicrophoneState.stopped));
    UtilHelpers.pop();

    if (path == null) {
      emit(state.copyWith(error: "No audio file path provided."));
      return;
    }

    final File audioFile = File(path);
    if (!audioFile.existsSync()) {
      emit(state.copyWith(error: "Audio file does not exist."));
      return;
    }

    emit(state.copyWith(apiState: ApiState.loading));

    try {
      final repoResponse = await _dashboardRepository.uploadAudio(audioFile);
      repoResponse.fold(
        (response) async {
          emit(
            state.copyWith(
              apiState: ApiState.success,
              responses: [...state.responses, response],
            ),
          );

          await _fileStorageService.storeFile(
            type: FileStorageType.prompt,
            bytes: response.bytes,
            createdAt: response.createdAt,
          );

          await _audioPlayerService.playAudio(
            BytesSource(
              Uint8List.fromList(response.bytes),
            ),
          );
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

  // @override
  // void onChange(Change<HomeState> change) {
  //   super.onChange(change);
  //   "$runtimeType ${change.currentState.apiState}".printLog();
  // }
}
