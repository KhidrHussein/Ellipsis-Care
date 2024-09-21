import 'package:hive_flutter/hive_flutter.dart';

part 'userdata.g.dart';

@HiveType(typeId: 0)
class UserData {
  UserData({
    required this.enableDarkMode,
    required this.showNotifications,
    required this.hasViewedOnboarding,
  });

  @HiveField(0, defaultValue: true)
  bool showNotifications;

  @HiveField(1, defaultValue: false)
  bool enableDarkMode;

  @HiveField(2, defaultValue: false)
  bool hasViewedOnboarding;
}