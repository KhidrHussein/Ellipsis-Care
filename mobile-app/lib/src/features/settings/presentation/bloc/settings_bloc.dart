import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ellipsis_care/core/api/exceptions/exceptions.dart';

import 'package:ellipsis_care/core/utils/utils.dart';
import 'package:ellipsis_care/core/services/local_storage.dart';
import 'package:ellipsis_care/core/services/secure_storage.dart';
import 'package:ellipsis_care/core/utils/storage_keys.dart';
import 'package:ellipsis_care/src/features/emergency/domain/emergency_contact.dart';
import 'package:ellipsis_care/src/features/reminders/models/reminder_model.dart/reminder_model.dart';
import 'package:ellipsis_care/src/features/settings/data/settings_repository.dart';
import 'package:ellipsis_care/src/features/settings/model/settings_model.dart';
import 'package:ellipsis_care/src/shared/models/user/user_model.dart';

import '../../../../../config/router/route_names.dart';

part 'settings_events.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<LoadSettingsEvent>(_loadSettings);
    on<UpdateThemeEvent>(_changeTheme);
    on<UpdateProfilePictureEvent>(_updateProfilePicture);
    on<UpdateNotificationPermissionEvent>(_canPushNotifications);
    on<UpdateLocationPermissionEvent>(_canUseLocation);
    on<UpdatePasswordEvent>(_updatePassword);
    on<UpdateProfileEvent>(_updateProfile);
    on<SignOutEvent>(_signOut);
  }
  final SettingsRepository _apiRepository = injector<SettingsRepository>();
  final LocalStorage _hiveStorage = injector<LocalStorage>();

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
    emit(state.copyWith(state: ApiState.loading));

    final Map<String, dynamic> payload = {
      "old_password": event.currentPassword,
      "new_password": event.newPassword,
      "confirm_new_password": event.confirmPassword,
    };

    final result = await _apiRepository.changePassword(payload);

    result.fold(
      (response) {
        emit(state.copyWith(state: ApiState.success, data: response));
      },
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(state.copyWith(state: ApiState.failed, error: errorMessage));
      },
    );
  }

  void _updateProfile(
      UpdateProfileEvent event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(state: ApiState.loading));

    final Map<String, dynamic> payload = {
      "first_name": event.firstName,
      "last_name": event.lastName,
      "email": event.email,
    };

    final result = await _apiRepository.updateProfile(payload);

    await result.fold(
      (success) async {
        _updateUser(
          firstName: success.data!.user.firstName,
          lastName: success.data!.user.lastName,
          email: success.data!.user.email,
        );

        emit(
          state.copyWith(
            state: ApiState.success,
            message: success.message,
          ),
        );
      },
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(state.copyWith(state: ApiState.failed, error: errorMessage));
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

  void _signOut(SignOutEvent event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(state: ApiState.loading));

    final result = await _apiRepository.logout();

    await result.fold(
      (success) async {
        await injector<SecureStorage>().deleteAll();
        await _hiveStorage
            .clearBoxStorage<EmergencyContact>(HiveBoxNames.emergency);
        await _hiveStorage
            .clearBoxStorage<ReminderModel>(HiveBoxNames.reminders);
        await _hiveStorage
            .clearBoxStorage<SettingsModel>(HiveBoxNames.settings);
        await _hiveStorage.clearBoxStorage<UserModel>(HiveBoxNames.user);

        emit(
          state.copyWith(
            state: ApiState.success,
            message: "You have been logged out.",
          ),
        );

        UtilHelpers.goTo(RouteNames.signIn);
      },
      (exception) {
        final errorMessage = AppExceptions.getErrorMessage(exception);
        emit(state.copyWith(state: ApiState.failed, error: errorMessage));
      },
    );
  }
}
