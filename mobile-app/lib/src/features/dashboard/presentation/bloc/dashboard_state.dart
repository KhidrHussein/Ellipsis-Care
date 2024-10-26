part of 'dashboard_bloc.dart';

sealed class DashboardState {}

class DefaultState implements DashboardState {}

class LoadingState implements DashboardState {}

class StartedRecordingState implements DashboardState {}

class EndedRecordingState<T> extends Equatable implements DashboardState {
  const EndedRecordingState({this.transcribedResult});

  final T? transcribedResult;
  @override
  List<Object?> get props => [transcribedResult];
}


