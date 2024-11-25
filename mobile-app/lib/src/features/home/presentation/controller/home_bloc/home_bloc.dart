import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/home/data/home_repository.dart';

import '../../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../../core/services/voice_command_service.dart';
import '../../../../../../core/utils/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc()
      : _voiceCommandService = injector<VoiceCommandService>(),
        _dashboardRepository = injector<HomeRepository>(),
        super(const InitialState()) {
    on<ActivateVoiceCommandEvent>(_activateVoiceCommand);
    on<UploadAudioToAIEvent>(_uploadAudio);
  }

  final VoiceCommandService _voiceCommandService;
  final HomeRepository _dashboardRepository;

  void _activateVoiceCommand(
      ActivateVoiceCommandEvent event, Emitter<HomeState> emit) async {
    await _voiceCommandService.listenAndConvertToWords();
  }

  void _uploadAudio(UploadAudioToAIEvent event, Emitter<HomeState> emit) async {
    emit(const LoadingState());

    if (event.audioFilePath == null) {
      emit(const UploadToAIFailed(error: "No audio file path provided."));
      return;
    }

    final File audioFile = File(event.audioFilePath!);
    if (!audioFile.existsSync()) {
      emit(const UploadToAIFailed(error: "Audio file does not exist."));
      return;
    }

    try {
      await _dashboardRepository.uploadAudio(audioFile).then((apiResult) {
        if (apiResult.response != null) {
          emit(UploadToAISuccessful(result: [apiResult.response]));
        } else {
          final errorMessage =
              AppExceptions.getErrorMessage(apiResult.exception!);
          emit(UploadToAIFailed(error: errorMessage));
        }
      });
    } catch (e) {
      emit(UploadToAIFailed(error: "An unexpected error occurred: $e"));
    }
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    change.printLog();
  }

  @override
  void onTransition(Transition<HomeEvents, HomeState> transition) {
    super.onTransition(transition);
    transition.printLog();
  }
}
