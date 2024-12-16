// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.imgPath,
    this.data,
    this.error = '',
    this.apiState = ApiState.none,
    this.enabledDarkMode = false,
    this.enabledNotifications = false,
    this.enabledLocation = false,
  });

  final bool enabledDarkMode;
  final bool enabledNotifications;
  final bool enabledLocation;
  final String? imgPath;
  final ApiState apiState;
  final dynamic data;
  final String error;

  SettingsState copyWith({
    bool? enabledDarkMode,
    bool? enabledNotifications,
    bool? enabledLocation,
    String? imgPath,
    ApiState? apiState,
    dynamic data,
    String? error,
  }) {
    return SettingsState(
      enabledDarkMode: enabledDarkMode ?? this.enabledDarkMode,
      enabledNotifications: enabledNotifications ?? this.enabledNotifications,
      enabledLocation: enabledLocation ?? this.enabledLocation,
      imgPath: imgPath ?? this.imgPath,
      apiState: apiState ?? this.apiState,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        enabledDarkMode,
        enabledNotifications,
        enabledLocation,
        imgPath,
        error,
        apiState,
      ];
}
