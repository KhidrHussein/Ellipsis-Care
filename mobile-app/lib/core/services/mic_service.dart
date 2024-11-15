import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';

import '../utils/extensions.dart';

class MicrophoneService {
  MicrophoneService() {
    _getRecordState();
  }

  final AudioRecorder _mic = AudioRecorder();

  Future<bool> checkForPermission() => _mic.hasPermission();

  Future<void> startRecording() async {
    final tempDir = await getApplicationCacheDirectory();

    try {
      await _mic.start(
        const RecordConfig(encoder: AudioEncoder.wav),
        path: "${tempDir.path}/${const Uuid().v4()}.wav",
      );
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> pauseRecording() async {
    try {
      await _mic.pause();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> resumeRecording() async {
    try {
      await _mic.resume();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<String?> stopRecording() async {
    try {
      return await _mic.stop();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }

  Future<void> dispose() async {
    try {
      await _mic.cancel();

      "DISPOSED $runtimeType".printLog();
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
