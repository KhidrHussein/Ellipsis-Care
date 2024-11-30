import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:ellipsis_care/src/shared/models/app_session/app_session_model.dart';

import '../../../../core/services/storage_service.dart';

part 'app_session_event.dart';
part 'app_session_state.dart';

class AppSessionBloc extends Bloc<AppSessionEvent, AppSessionState> {
  AppSessionBloc()
      : _storageService = injector<StorageService>(),
        super(const AppSessionState()) {
    on<LoadAppSessionEvent>(_loadUserSession);
    on<EnableDarkModeEvent>(_updateUserSession);
  }

  final StorageService _storageService;

  void _loadUserSession(
      LoadAppSessionEvent event, Emitter<AppSessionState> emit) async {
    final data = await _storageService.getAppSession();
    emit(state.copyWith(appSession: data));
  }

  void _updateUserSession(
      EnableDarkModeEvent event, Emitter<AppSessionState> emit) async {
    await _storageService.getAppSession().then((session) async {
      emit(state.copyWith(appSession: session));
      session?.hasEnabledDarkMode = event.darkModeIsEnabled;
      await session?.save();
    });
  }
}