import 'package:ellipsis_care/core/services/background_audio_handler.dart';
import 'package:ellipsis_care/core/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../config/app_config.dart';
import '../../src/features/authentication/data/auth_repository.dart';
import '../../src/features/home/data/home_repository.dart';
import '../../src/features/reminders/data/reminders_repository.dart';
import '../services/api_service.dart';
import '../services/audio_player_service.dart';
import '../services/contacts_service.dart';
import '../services/file_storage_service.dart';
import '../services/mic_service.dart';
import '../services/notification_service.dart';
import '../services/oauth_service.dart';
import '../services/hive_storage_service.dart';
import '../services/voice_command_service.dart';

final injector = GetIt.instance;

void initService(AppConfig config) {
  injector.registerLazySingleton<SecureStorage>(() => SecureStorage());
  injector
      .registerLazySingleton<FileStorageService>(() => FileStorageService());
  injector.registerLazySingleton<ApiService>(
    () => ApiService(baseUrl: config.baseUrl),
  );
  injector.registerLazySingleton<OAuthService>(() => OAuthService());
  injector
      .registerLazySingleton<HiveStorageService>(() => HiveStorageService());
  injector.registerLazySingleton<MicrophoneService>(() => MicrophoneService());
  injector
      .registerLazySingleton<VoiceCommandService>(() => VoiceCommandService());
  injector
      .registerLazySingleton<PhoneContactService>(() => PhoneContactService());
  injector
      .registerLazySingleton<AudioPlayerService>(() => AudioPlayerService());
  injector.registerLazySingleton<BackgroundAudioService>(
      () => BackgroundAudioService());
  injector
      .registerLazySingleton<NotificationService>(() => NotificationService());

  injector.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository());

  injector.registerLazySingleton<HomeRepository>(() => HomeRepository());

  injector
      .registerLazySingleton<ReminderRepository>(() => ReminderRepository());
}
