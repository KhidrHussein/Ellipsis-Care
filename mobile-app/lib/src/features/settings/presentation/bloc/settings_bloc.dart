import 'dart:io';

import 'package:ellipsis_care/core/api/exceptions/exceptions.dart';
import 'package:ellipsis_care/core/enums/api_state.dart';
import 'package:ellipsis_care/core/services/hive_storage_service.dart';
import 'package:ellipsis_care/core/utils/injector.dart';
import 'package:ellipsis_care/src/features/settings/data/settings_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'settings_state.dart';
part 'settings_events.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<LoadSettingsEvent>(_loadSettings);
    on<UpdateThemeEvent>(_changeTheme);
    on<UpdateProfilePictureEvent>(_updateProfilePicture);
    on<UpdateNotificationPermissionEvent>(_canPushNotifications);
    on<UpdateLocationPermissionEvent>(_canUseLocation);
    on<UpdatePasswordEvent>(_updatePassword);
    on<UpdateProfileEvent>(_updateProfile);
  }
  final SettingsRepository _apiRepository = injector<SettingsRepository>();
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

  void _updateProfilePicture(
      UpdateProfilePictureEvent event, Emitter<SettingsState> emit) async {
    File? picture;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      picture = File(image.path);
      await _hiveStorage.getUser().then((user) async {
        user?.photoUrl = picture?.path;
        await user?.save();
      });
    }
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
      UpdatePasswordEvent event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(apiState: ApiState.loading));

    final Map<String, dynamic> payload = {
      "old_password": event.currentPassword,
      "new_password": event.newPassword,
      "confirm_new_password": event.confirmPassword,
    };

    final result = await _apiRepository.changePassword(payload);

    result.fold(
      (response) {
        emit(state.copyWith(apiState: ApiState.success, data: response));
      },
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(state.copyWith(apiState: ApiState.failed, error: errorMessage));
      },
    );
  }

  void _updateProfile(
      UpdateProfileEvent event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(apiState: ApiState.loading));

    final Map<String, dynamic> payload = {
      "first_name": event.firstName,
      "last_name": event.lastName,
      "email": event.email,
    };

    final result = await _apiRepository.updateProfile(payload);

    result.fold(
      (response) async {
        _updateUser(
          firstName: response.user.firstName,
          lastName: response.user.lastName,
          email: response.user.email,
        );
        emit(state.copyWith(apiState: ApiState.success));
      },
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(state.copyWith(apiState: ApiState.failed, error: errorMessage));
      },
    );
  }

  void _updateUser({String? firstName, String? lastName, String? email}) async {
    await _hiveStorage.getUser().then((user) async {
      user?.firstname = firstName;
      user?.lastname = lastName;
      user?.email = email;
      await user?.save();
    });
  }
}
