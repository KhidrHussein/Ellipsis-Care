// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 8)
class SettingsModel extends HiveObject {
  @HiveField(0)
  bool isDarkMode;

  @HiveField(1)
  bool isNotificationEnabled;

  @HiveField(2)
  bool isLocationEnabled;

  SettingsModel({
    this.isDarkMode = false,
    this.isNotificationEnabled = false,
    this.isLocationEnabled = false,
  });

  @override
  String toString() => 'SettingsModel(isDarkMode: $isDarkMode, isNotificationEnabled: $isNotificationEnabled, isLocationEnabled: $isLocationEnabled)';
}
