import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ellipsis_care/core/services/audio_player_service.dart';
import 'package:ellipsis_care/core/utils/injector.dart';

class BackgroundAudioService {
  AudioPlayerServiceHandler? _handler;

  AudioPlayerServiceHandler get handler => _handler!;

  void init() async {
    _handler = await AudioService.init<AudioPlayerServiceHandler>(
      builder: () => AudioPlayerServiceHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.ellipsis.ellipsis_care',
        androidNotificationChannelName: 'AI Audio Controller',
      ),
    );
  }
}

class AudioPlayerServiceHandler extends BaseAudioHandler with QueueHandler {
  final AudioPlayer _audioPlayer = injector<AudioPlayerService>().player;

  Source? _source;
  void setSource(Source src) {
    _source = src;
  }

  @override
  Future<void> play() async {
    if (_source != null) {
      await _audioPlayer.play(_source!);
    } else {
      // Handle the case where _source is not set
      throw Exception('Source not set');
    }
  }

  @override
  Future<void> stop() => _audioPlayer.stop();
}
