import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

class MicrophoneService {
  MicrophoneService._internal();
  static MicrophoneService instance = MicrophoneService._internal();
  factory MicrophoneService() => instance;

  final AudioRecorder _mic = AudioRecorder();

  Future<bool> checkForPermission() {
    return _mic.hasPermission();
  }

  Future<void> startRecording() async {
    final tempDir = await getApplicationCacheDirectory();
    try {
      _mic.start(
        const RecordConfig(encoder: AudioEncoder.opus),
        path: "${tempDir.path}/audio_file.opus",
      );
      "STARTED RECORDING".printLog();
    } catch (e) {
      "An error occured in $this: $e".printLog();
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
      "An error occured in $this: $e".printLog();
    }

    return path;
  }

  Future<void> dispose() async {
    try {
      await _mic.cancel();
      "DISPOSED $this".printLog();
    } catch (e) {
      "An error occured in $this: $e".printLog();
    }
  }

  Stream<RecordState> getRecordState() {
    return _mic.onStateChanged();
  }
}
