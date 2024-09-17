import 'dart:io';

import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/mic_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/data/repository.dart';

part 'event.dart';
part 'state.dart';

class DashboardBloc extends Bloc<DashboardEvents, DashboardState> {
  DashboardBloc()
      : _service = injector<MicrophoneService>(),
        super(InitialState()) {
    on<StartRecordingEvent>(_startRecording);
    on<StopRecordingEvent>(_stopRecording);
  }

  final MicrophoneService _service;

  void _startRecording(
      StartRecordingEvent event, Emitter<DashboardState> handler) async {
    final bool hasPermission = await _service.checkForPermission();

    if (hasPermission) {
      await _service.startRecording();
      handler.call(RecordingState());
    }

    "DashboardBloc:\n Current State: $state".printLog();
  }

  void _stopRecording(
      StopRecordingEvent event, Emitter<DashboardState> handler) async {
    await _service.stopRecording().then((value) async {
      handler.call(LoadingState());

      File data = File(value ?? "");
      final repository = DashboardRepository();
      final ai = await repository.sendAudioFile(data);
      
      handler.call(
        NotRecordingState(aiResponse: ai),
      );
    });

    "DashboardBloc:\n Current State: $state".printLog();
  }
}
