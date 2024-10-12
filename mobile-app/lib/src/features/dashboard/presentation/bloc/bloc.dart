
import '../../../../../core/services/speech_service.dart';
import '../../../../../core/utils/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions.dart';

part 'event.dart';
part 'state.dart';

class DashboardBloc extends Bloc<DashboardEvents, DashboardState> {
  DashboardBloc()
      : _service = injector<SpeechService>(),
        super(InitialState()) {
    on<StartRecordingEvent>(_startRecording);
    on<StopRecordingEvent>(_stopRecording);
  }

  final SpeechService _service;

  void _startRecording(
      StartRecordingEvent event, Emitter<DashboardState> handler) async {
    handler.call(RecordingState());

    await _service.listenAndConvertToWords(onResult: (value) {
      value.printLog();
    });

    // final bool hasPermission = await _service.checkForPermission();

    // if (hasPermission) {
    //   await _service.startRecording();
    //   handler.call(RecordingState());
    // }

    "$runtimeType State: $state".printLog();
  }

  void _stopRecording(
      StopRecordingEvent event, Emitter<DashboardState> handler) async {
    await _service.stopListening();

    handler.call(const NotRecordingState());

    // await _service.stopRecording().then((value) async {
    //   handler.call(LoadingState());

    //   File data = File(value ?? "");
    //   final repository = DashboardRepository();
    //   final ai = await repository.sendAudioFile(data);

    //   handler.call(
    //     NotRecordingState(aiResponse: ai),
    //   );
    // });

    "$runtimeType State: $state".printLog();
  }
}
