// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "app_session_bloc.dart";

class AppSessionState extends Equatable {
  const AppSessionState({this.appSession});
  final AppSessionModel? appSession;

  AppSessionState copyWith({AppSessionModel? appSession}) {
    return AppSessionState(appSession: appSession ?? this.appSession);
  }

  @override
  List<Object?> get props => [appSession];
}
