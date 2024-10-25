import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:uuid/uuid.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer(playerId: const Uuid().v4());

  Future<void> playAudio(Uint8List bytes) async {
    try {
      await _audioPlayer.play(BytesSource(bytes));

      "PLAYING".printLog();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> stopAudio() async {
    try {
      await _audioPlayer.stop();

      "PAUSED".printLog();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }

  Future<void> dispose() async {
    try {
      await _audioPlayer.dispose();

      "DISPOSED $runtimeType".printLog();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }
}
