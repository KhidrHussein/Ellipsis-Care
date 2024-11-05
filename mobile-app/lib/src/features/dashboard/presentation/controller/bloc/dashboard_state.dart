part of 'dashboard_bloc.dart';

sealed class DashboardState {}

class DefaultState implements DashboardState {}

class LoadingState implements DashboardState {}

class StartRecordingState implements DashboardState {}

class EndRecordingState<T> extends Equatable implements DashboardState {
  const EndRecordingState({this.transcribedResult});

  final T? transcribedResult;
  @override
  List<Object?> get props => [transcribedResult];
}
