import '../services/notification_service.dart';
import '../services/speech_service.dart';
import '../../src/features/authentication/data/firebase_auth_repo.dart';
import '../../src/features/authentication/domain/repository/authentication_repo.dart';
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
  injector
      .registerLazySingleton<PhoneContactService>(() => PhoneContactService());
  injector.registerLazySingleton<NotificationService>(
      () => NotificationService());
  injector.registerLazySingleton<MicrophoneService>(() => MicrophoneService());
  injector.registerLazySingleton<SpeechService>(() => SpeechService());

  injector.registerLazySingleton<BaseAuthenticationRepository>(
      () => FirebaseAuthRepo());
}
