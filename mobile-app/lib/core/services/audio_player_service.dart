import 'package:audioplayers/audioplayers.dart';
import 'package:uuid/uuid.dart';

import '../utils/extensions.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer(playerId: const Uuid().v4());

  AudioPlayer get player => _audioPlayer;

  Future<void> playAudio(Source audioSource) async {
    try {
      await _audioPlayer.play(audioSource);

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
