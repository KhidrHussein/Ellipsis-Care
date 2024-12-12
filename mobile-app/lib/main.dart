import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:ellipsis_care/config/app_config.dart';
import 'package:ellipsis_care/core/services/background_audio_handler.dart';

import 'core/services/hive_storage_service.dart';
import 'core/services/notification_service.dart';
import 'core/utils/injector.dart';
import 'ellipsis_care.dart';

void initializeApp(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  initService(config);

  // Initialize [Hive]
  await injector<HiveStorageService>().initializeStorage();

  // Register [Storage Service] type adapters
  injector<HiveStorageService>().registerModels();

  injector<BackgroundAudioService>().init();

  await injector<NotificationService>().init();

  await Firebase.initializeApp();

  runApp(EllipsisCare(config: config));
}
