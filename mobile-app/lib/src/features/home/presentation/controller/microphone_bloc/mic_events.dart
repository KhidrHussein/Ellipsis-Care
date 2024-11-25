part of "mic_bloc.dart";

sealed class MicrophoneEvents {}

class StartRecordingEvent implements MicrophoneEvents {}

class PauseRecordingEvent implements MicrophoneEvents {}

class ResumeRecordingEvent implements MicrophoneEvents {}

class StopRecordingEvent implements MicrophoneEvents {}
