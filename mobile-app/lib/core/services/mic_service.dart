import 'package:record/record.dart';

class AudioService {
  AudioService._internal();
  static AudioService instance = AudioService._internal();
  factory AudioService() => instance;

  final AudioRecorder _mic = AudioRecorder();

  Future<bool> checkForPermission() {
    return _mic.hasPermission();
  }

  startRecording() {
    // _mic.start(RecordConfig(), path: );
  }
}
