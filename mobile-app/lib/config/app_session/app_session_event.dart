part of "app_session_bloc.dart";

abstract class AppSessionEvent {}

class LoadAppSessionEvent implements AppSessionEvent {}

class EnableDarkModeEvent implements AppSessionEvent {
  EnableDarkModeEvent({required this.darkModeIsEnabled});

  final bool darkModeIsEnabled;
}
