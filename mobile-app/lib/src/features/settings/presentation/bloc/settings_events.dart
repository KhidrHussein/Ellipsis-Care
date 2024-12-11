part of 'settings_bloc.dart';

sealed class SettingsEvent {}

class LoadSettingsEvent implements SettingsEvent {}

class UpdateThemeEvent implements SettingsEvent {
  final bool enableDarkMode;
  const UpdateThemeEvent({required this.enableDarkMode});
}

class UpdateNotificationPermissionEvent implements SettingsEvent {
  final bool enableNotifications;
  const UpdateNotificationPermissionEvent({required this.enableNotifications});
}

class UpdateLocationPermissionEvent implements SettingsEvent {
  final bool enableLocation;
  const UpdateLocationPermissionEvent({required this.enableLocation});
}

class UpdatePasswordEvent implements SettingsEvent {
  final String currentPassword;
  final String newPassword;

  const UpdatePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
  });
}
