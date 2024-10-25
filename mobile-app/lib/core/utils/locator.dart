import 'package:ellipsis_care/core/services/audio_player_service.dart';
import 'package:ellipsis_care/src/features/authentication/data/auth_repository.dart';

import '../services/notification_service.dart';
import '../services/speech_service.dart';
import 'package:get_it/get_it.dart';

import 'package:ellipsis_care/core/services/mic_service.dart';
import 'package:ellipsis_care/core/services/oauth_service.dart';
import 'package:ellipsis_care/core/services/storage_service.dart';

import '../services/api_service.dart';
import '../services/contacts_service.dart';

final injector = GetIt.instance;

void initService() {
  injector.registerLazySingleton<ApiService>(() => ApiService());
  injector.registerLazySingleton<OAuthService>(() => OAuthService());
  injector.registerLazySingleton<StorageService>(() => StorageService());
  injector.registerLazySingleton<MicrophoneService>(() => MicrophoneService());
  injector.registerLazySingleton<SpeechService>(() => SpeechService());
  injector
      .registerLazySingleton<PhoneContactService>(() => PhoneContactService());
  injector
      .registerLazySingleton<NotificationService>(() => NotificationService());
  injector
      .registerLazySingleton<AudioPlayerService>(() => AudioPlayerService());
  injector.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository());
}
