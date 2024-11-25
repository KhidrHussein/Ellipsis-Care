import 'package:ellipsis_care/core/services/storage_service.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:ellipsis_care/src/features/authentication/models/userdata/userdata.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_session_event.dart';
part 'app_session_state.dart';

class AppSessionBloc extends Bloc<AppSessionEvent, AppSessionState> {
  AppSessionBloc()
      : _storageService = injector<StorageService>(),
        super(const NullSessionState()) {
    on<LoadAppSessionEvent>(_loadUserSession);
    on<EnableDarkModeEvent>(_updateUserSession);
  }

  final StorageService _storageService;

  void _loadUserSession(
      LoadAppSessionEvent event, Emitter<AppSessionState> handler) async {
    final data = await _storageService.getUserData();
    handler.call(UserSessionState(session: data!));
  }

  void _updateUserSession(
      EnableDarkModeEvent event, Emitter<AppSessionState> handler) async {
    final data = await _storageService.getUserData();
    data!.enableDarkMode = event.darkModeIsEnabled;
    data.save();

    handler.call(UserSessionState(session: data));
  }
}
