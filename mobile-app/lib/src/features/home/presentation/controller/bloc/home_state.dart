part of 'home_bloc.dart';

sealed class HomeState {}

class DefaultState implements HomeState {}

class LoadingState implements HomeState {}

class StartRecordingState implements HomeState {}

class EndRecordingState<T> extends Equatable implements HomeState {
  const EndRecordingState({this.transcribedResult});

  final T? transcribedResult;
  @override
  List<Object?> get props => [transcribedResult];
}
