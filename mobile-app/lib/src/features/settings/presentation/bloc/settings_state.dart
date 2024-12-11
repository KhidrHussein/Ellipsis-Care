// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.enabledDarkMode = false,
    this.enabledNotifications = false,
    this.enabledLocation = false,
  });

  final bool enabledDarkMode;
  final bool enabledNotifications;
  final bool enabledLocation;

  SettingsState copyWith({
    bool? enabledDarkMode,
    bool? enabledNotifications,
    bool? enabledLocation,
  }) {
    return SettingsState(
      enabledDarkMode: enabledDarkMode ?? this.enabledDarkMode,
      enabledNotifications: enabledNotifications ?? this.enabledNotifications,
      enabledLocation: enabledLocation ?? this.enabledLocation,
    );
  }

  @override
  List<Object?> get props =>
      [enabledDarkMode, enabledNotifications, enabledLocation];
}
