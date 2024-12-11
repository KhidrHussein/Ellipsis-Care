import 'package:ellipsis_care/core/services/hive_storage_service.dart';
import 'package:ellipsis_care/core/utils/injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';
part 'settings_events.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<LoadSettingsEvent>(_loadSettings);
    on<UpdateThemeEvent>(_changeTheme);
    on<UpdateNotificationPermissionEvent>(_canPushNotifications);
    on<UpdateLocationPermissionEvent>(_canUseLocation);
    on<UpdatePasswordEvent>(_updatePassword);
  }
  final HiveStorageService _hiveStorage = injector<HiveStorageService>();

  void _loadSettings(
      LoadSettingsEvent event, Emitter<SettingsState> emit) async {
    final data = await _hiveStorage.getSettings();
    emit(
      state.copyWith(
        enabledDarkMode: data?.isDarkMode,
        enabledNotifications: data?.isNotificationEnabled,
        enabledLocation: data?.isLocationEnabled,
      ),
    );
  }

  void _changeTheme(UpdateThemeEvent event, Emitter<SettingsState> emit) async {
    await _hiveStorage.getSettings().then((settings) async {
      settings?.isDarkMode = event.enableDarkMode;
      await settings?.save();
      emit(state.copyWith(enabledDarkMode: event.enableDarkMode));
    });
  }

  void _canPushNotifications(UpdateNotificationPermissionEvent event,
      Emitter<SettingsState> emit) async {
    await _hiveStorage.getSettings().then((settings) async {
      settings?.isNotificationEnabled = event.enableNotifications;
      await settings?.save();
      emit(state.copyWith(enabledNotifications: event.enableNotifications));
    });
  }

  void _canUseLocation(
      UpdateLocationPermissionEvent event, Emitter<SettingsState> emit) async {
    await _hiveStorage.getSettings().then((settings) async {
      settings?.isLocationEnabled = event.enableLocation;
      await settings?.save();
      emit(state.copyWith(enabledNotifications: event.enableLocation));
    });
  }

  void _updatePassword(
      UpdatePasswordEvent event, Emitter<SettingsState> emit) async {}
}
