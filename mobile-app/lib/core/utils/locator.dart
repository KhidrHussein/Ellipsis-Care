import 'package:ellipsis_care/src/features/authentication/data/auth_repository.dart';
import 'package:ellipsis_care/src/features/home/data/dashboard_repository.dart';
import 'package:ellipsis_care/src/features/reminders/data/reminders_repository.dart';

import '../services/notification_service.dart';
import '../services/voice_command_service.dart';
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
  injector
      .registerLazySingleton<VoiceCommandService>(() => VoiceCommandService());
  injector
      .registerLazySingleton<PhoneContactService>(() => PhoneContactService());
  injector
      .registerLazySingleton<NotificationService>(() => NotificationService());

  injector.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository());
  injector
      .registerLazySingleton<DashboardRepository>(() => DashboardRepository());
  injector
      .registerLazySingleton<ReminderRepository>(() => ReminderRepository());
}
