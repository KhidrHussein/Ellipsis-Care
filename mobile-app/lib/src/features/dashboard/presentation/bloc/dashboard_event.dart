part of 'dashboard_bloc.dart';

sealed class DashboardEvents {}

class ActivateVoiceCommandEvent extends DashboardEvents {}

class StartMicrophoneEvent extends DashboardEvents {}

class EndMicrophoneEvent extends DashboardEvents {}
