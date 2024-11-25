import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../../../../../core/services/mic_service.dart';
import '../../../../../../core/utils/locator.dart';

part 'mic_events.dart';
part 'mic_state.dart';

class MicrophoneBloc extends Bloc<MicrophoneEvents, MicrophoneState> {
  MicrophoneBloc()
      : _microphoneService = injector<MicrophoneService>(),
        super(InitialState()) {
    on<StartRecordingEvent>(_startRecording);
    on<PauseRecordingEvent>(_pauseRecording);
    on<ResumeRecordingEvent>(_resumeRecording);
    on<StopRecordingEvent>(_stopRecording);
  }

  final MicrophoneService _microphoneService;

  void _startRecording(
      StartRecordingEvent event, Emitter<MicrophoneState> emit) async {
    await _microphoneService.startRecording();
    emit(RecordingStarted());
  }

  void _stopRecording(
      StopRecordingEvent event, Emitter<MicrophoneState> emit) async {
    final path = await _microphoneService.stopRecording();
    emit(RecordingStopped(filePath: path));
  }

  void _pauseRecording(
      PauseRecordingEvent event, Emitter<MicrophoneState> emit) async {
    await _microphoneService.pauseRecording();
    emit(RecordingPaused());
  }

  void _resumeRecording(
      ResumeRecordingEvent event, Emitter<MicrophoneState> emit) async {
    await _microphoneService.resumeRecording();
    emit(RecordingResumed());
  }

  @override
  void onTransition(Transition<MicrophoneEvents, MicrophoneState> transition) {
    super.onTransition(transition);
    transition.printLog();
  }
}
