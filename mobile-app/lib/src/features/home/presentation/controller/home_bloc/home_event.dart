part of 'home_bloc.dart';

sealed class HomeEvents {}

final class ActivateVoiceCommandEvent extends HomeEvents {}

final class UploadAudioToAIEvent extends HomeEvents {
  UploadAudioToAIEvent({this.audioFilePath});

  final String? audioFilePath;
}
