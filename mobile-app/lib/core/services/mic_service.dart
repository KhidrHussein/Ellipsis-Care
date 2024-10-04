import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

class MicrophoneService {
  final AudioRecorder _mic = AudioRecorder();

  Future<bool> checkForPermission() => _mic.hasPermission();

  Future<void> startRecording() async {
    final tempDir = await getApplicationCacheDirectory();

    try {
      _mic.start(
        const RecordConfig(encoder: AudioEncoder.wav),
        path: "${tempDir.path}/audio.wav",
      );

      "STARTED RECORDING".printLog();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<String?> stopRecording() async {
    String? path;

    try {
      await _mic.stop().then((value) async {
        path = value;
        "PATH TO FILE: $value".printLog();
      });

      "STOPPED RECORDING".printLog();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }

    return path;
  }

  Future<void> dispose() async {
    try {
      await _mic.cancel();

      "DISPOSED $runtimeType".printLog();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Stream<RecordState> getRecordState() {
    return _mic.onStateChanged();
  }
}
