// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'app_session_model.g.dart';

@HiveType(typeId: 0)
class AppSessionModel extends HiveObject {
  @HiveField(0)
  bool hasEnabledDarkMode;

  @HiveField(1)
  bool hasUserOnboard;

  @HiveField(2)
  bool isLoggedIn;

  @HiveField(3)
  bool canPushNotifications;

  @HiveField(4)
  bool canUseEmergencyServices;

  AppSessionModel({
    required this.isLoggedIn,
    required this.hasUserOnboard,
    required this.hasEnabledDarkMode,
    required this.canPushNotifications,
    required this.canUseEmergencyServices,
  });
}
