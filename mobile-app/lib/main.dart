import 'core/utils/helpers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

import 'config/env.dart';
import 'core/services/background_audio_handler.dart';
import 'core/services/hive_storage_service.dart';
import 'core/services/notification_service.dart';
import 'core/utils/injector.dart';
import 'ellipsis_care.dart';

Future<void> initializeApp({FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = TalkerBlocObserver(talker: UtilHelpers.logger);

  // Initialize services
  initService();

  // Initialize [Hive]
  await injector<HiveStorageService>().initializeStorage();

  // Register [Storage Service] type adapters{
  injector<HiveStorageService>().registerModels();

  injector<BackgroundAudioService>().init();

  await injector<NotificationService>().init();

  await Firebase.initializeApp(options: firebaseOptions);

  await SentryFlutter.init(
    (options) {
      options.dsn = Env.sentryDSN;
      options.environment = Env.flavor;
    },
    // Init your App.
    appRunner: () => runApp(EllipsisCare()),
  );
}
