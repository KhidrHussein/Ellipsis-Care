import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:uuid/uuid.dart';

class BackgroundAudioService {
  AudioPlayerServiceHandler? _handler;

  AudioPlayerServiceHandler get handler => _handler!;

  void init() async {
    _handler = await AudioService.init<AudioPlayerServiceHandler>(
      builder: () => AudioPlayerServiceHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'ellipsis_care_reminder',
        androidNotificationChannelName: 'Ellipsis Care Reminder',
        androidNotificationOngoing: true,
      ),
    );
  }
}

class AudioPlayerServiceHandler extends BaseAudioHandler with QueueHandler {
  final AudioPlayer _audioPlayer = AudioPlayer(playerId: const Uuid().v4());

  String path = '';

  @override
  Future<void> play() async {
    path.printLog();
    await _audioPlayer.play(DeviceFileSource(path));
  }

  @override
  Future<void> stop() => _audioPlayer.stop();
}
