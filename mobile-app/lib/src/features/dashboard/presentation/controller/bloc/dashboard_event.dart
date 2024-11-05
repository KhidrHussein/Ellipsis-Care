part of 'dashboard_bloc.dart';

sealed class DashboardEvents {}

class ActivateVoiceCommandEvent extends DashboardEvents {}

class StartRecordingEvent extends DashboardEvents {}

class EndRecordingEvent extends DashboardEvents {}
