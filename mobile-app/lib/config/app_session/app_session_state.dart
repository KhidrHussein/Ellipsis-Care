part of "app_session_bloc.dart";

sealed class AppSessionState extends Equatable {
  final UserData? session;
  const AppSessionState({this.session});

  @override
  List<Object?> get props => [session];

  @override
  bool? get stringify => true;
}

class NullSessionState extends AppSessionState {
  const NullSessionState() : super(session: null);
}

class UserSessionState extends AppSessionState {
  const UserSessionState({required super.session});
}
