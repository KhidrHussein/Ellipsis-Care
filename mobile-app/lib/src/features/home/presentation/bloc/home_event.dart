part of 'home_bloc.dart';

sealed class HomeEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartRecordingEvent extends HomeEvents {}

class PauseRecordingEvent extends HomeEvents {}

class ResumeRecordingEvent extends HomeEvents {}

class StopRecordingEvent extends HomeEvents {}

class ResetEvent extends HomeEvents {}
