// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

class SettingsState<T> extends AppState {
  const SettingsState({
    super.data,
    super.error = '',
    super.message = "",
    super.state = ApiState.none,
    this.imgPath,
    this.enabledDarkMode = false,
    this.enabledNotifications = false,
    this.enabledLocation = false,
  });

  final String? imgPath;
  final bool enabledDarkMode;
  final bool enabledNotifications;
  final bool enabledLocation;

  SettingsState<T> copyWith({
    T? data,
    String? message,
    String? error,
    String? imgPath,
    ApiState? state,
    bool? enabledDarkMode,
    bool? enabledNotifications,
    bool? enabledLocation,
  }) {
    return SettingsState<T>(
      data: data ?? this.data,
      message: message ?? this.message,
      error: error ?? this.error,
      state: state ?? this.state,
      imgPath: imgPath ?? this.imgPath,
      enabledDarkMode: enabledDarkMode ?? this.enabledDarkMode,
      enabledLocation: enabledLocation ?? this.enabledLocation,
      enabledNotifications: enabledNotifications ?? this.enabledNotifications
    );
  }

  @override
  List<Object?> get props => [data, error, message, state];
}
