part of "app_session_bloc.dart";

sealed class AppSessionEvent {}

class InitializeAppSessionEvent implements AppSessionEvent {}

class LoadAppSessionEvent implements AppSessionEvent {}

class EnableDarkModeEvent implements AppSessionEvent {
  EnableDarkModeEvent({required this.darkModeIsEnabled});

  final bool darkModeIsEnabled;
}
