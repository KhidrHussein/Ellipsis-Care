import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

class AudioService {
  AudioService._internal();
  static AudioService instance = AudioService._internal();
  factory AudioService() => instance;

  final AudioRecorder _mic = AudioRecorder();

  Future<bool> checkForPermission() {
    return _mic.hasPermission();
  }

  Future<void> startRecording() async {
    final tempDir = await getApplicationCacheDirectory();
    try {
      _mic.start(
        const RecordConfig(),
        path: "${tempDir.path}/audio_file",
      );
      "STARTED RECORDING".printLog();
    } catch (e) {
      "An error occured in $this: $e".printLog();
    }
  }

  Future<String?> stopRecording() async {
    String? path;
    try {
      await _mic.stop().then((value) {
        path = value;
        "PATH TO FILE: $value".printLog();
      });
      "STOPPED RECORDING".printLog();
    } catch (e) {
      "An error occured in $this: $e".printLog();
    }
    _mic.dispose();
    return path;
  }

 Stream<RecordState> getRecordState() {
    return _mic.onStateChanged();
  }
}
