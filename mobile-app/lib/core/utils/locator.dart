import 'package:ellipsis_care/core/services/mic_service.dart';
import 'package:ellipsis_care/core/services/oauth_service.dart';
import 'package:ellipsis_care/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

import '../services/api_service.dart';
import '../services/contacts_service.dart';

final injector = GetIt.instance;

void initService() {
  injector.registerSingleton<ApiService>(ApiService());
  injector.registerLazySingleton<OAuthService>(() => OAuthService());
  injector.registerLazySingleton<StorageService>(() => StorageService());
  injector
      .registerLazySingleton<PhoneContactService>(() => PhoneContactService());
  injector.registerLazySingleton<MicrophoneService>(() => MicrophoneService());
}
