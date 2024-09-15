part of 'bloc.dart';

sealed class DashboardState implements ApiState {}

class InitialState implements DashboardState {}

class RecordingState implements DashboardState {}

class LoadingState implements DashboardState {}

class NotRecordingState<T> extends Equatable implements DashboardState {
  const NotRecordingState({this.aiResponse});

  final T? aiResponse;
  @override
  List<Object?> get props => [aiResponse];
}
