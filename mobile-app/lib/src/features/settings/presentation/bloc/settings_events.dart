part of 'settings_bloc.dart';

sealed class SettingsEvent {}

class LoadSettingsEvent implements SettingsEvent {}

class UpdateProfilePictureEvent implements SettingsEvent {}

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
  final String confirmPassword;

  const UpdatePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}

class UpdateProfileEvent implements SettingsEvent {
  final String? firstName;
  final String? lastName;
  final String? email;

  const UpdateProfileEvent({this.email, this.firstName, this.lastName});
}
