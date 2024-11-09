import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/mic_service.dart';
import '../../../../../../core/utils/locator.dart';

/// [true] - We are recording
/// [false] - Recording stopped 

class DashboardCubit extends Cubit<bool> {
  DashboardCubit()
      : _microphoneService = injector<MicrophoneService>(),
        super(true);

  final MicrophoneService _microphoneService;

  void pauseRecording() async {
    await _microphoneService.pauseRecording().then((value) {
      emit(false);
    });
  }

  void resumeRecording() async {
    await _microphoneService.resumeRecording().then((value) {
      emit(true);
    });
  }
}
