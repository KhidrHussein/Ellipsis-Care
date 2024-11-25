part of "mic_bloc.dart";

sealed class MicrophoneState extends Equatable {
  const MicrophoneState();

  @override
  List<Object?> get props => [];
}

class InitialState extends MicrophoneState {}

class RecordingStarted extends MicrophoneState {}

class RecordingPaused extends MicrophoneState {}

class RecordingResumed extends MicrophoneState {}

class RecordingStopped extends MicrophoneState {
  final String? filePath;
  const RecordingStopped({required this.filePath});

  @override
  List<Object?> get props => [filePath];
}
