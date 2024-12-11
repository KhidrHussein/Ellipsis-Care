import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'package:ellipsis_care/core/utils/enums/file_storage_type.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';

import '../utils/extensions.dart';

class MicrophoneService {
  MicrophoneService() {
    _getRecordState();
  }

  final AudioRecorder _mic = AudioRecorder();

  Future<bool> checkForPermission() => _mic.hasPermission();

  Future<String?> stopRecording() => _mic.stop();

  Future<void> pauseRecording() => _mic.pause();

  Future<void> resumeRecording() => _mic.resume();

  Future<void> dispose() => _mic.dispose();

  Future<void> startRecording() async {
    final dir = await getApplicationDocumentsDirectory();
    final date =
        UtilHelpers.getDateFromIsoString(DateTime.now().toIso8601String());
    final time =
        UtilHelpers.getTimeFromIsoString(DateTime.now().toIso8601String());

    try {
      await _mic.start(
        RecordConfig(encoder: AudioEncoder.wav),
        path: "${dir.path}/${FileStorageType.microphone.name}_$date$time.wav",
      );
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  void _getRecordState() {
    _mic.onStateChanged().listen(
      (RecordState recordState) {
        printLog("$runtimeType state: $recordState");
      },
      onError: (error, stacktrace) {
        printLog("$runtimeType error: $error");
      },
    );
  }
}
