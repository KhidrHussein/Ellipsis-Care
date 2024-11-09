part of 'home_bloc.dart';

sealed class HomeEvents {}

class ActivateVoiceCommandEvent extends HomeEvents {}

class StartRecordingEvent extends HomeEvents {}

class EndRecordingEvent extends HomeEvents {}
