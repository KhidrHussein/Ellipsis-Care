// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeState {}

class DefaultState implements HomeState {}

class LoadingState implements HomeState {}

class StartRecordingState implements HomeState {}

class EndRecordingState extends Equatable implements HomeState {
  const EndRecordingState({this.transcribedResult});

  final List<TranscribedResponse>? transcribedResult;
  @override
  List<Object?> get props => [transcribedResult];

  @override
  bool get stringify => true;
}
