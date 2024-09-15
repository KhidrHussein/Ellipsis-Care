part of 'bloc.dart';

sealed class DashboardEvents {}

class NotRecordingEvent extends DashboardEvents {}

class StartRecordingEvent extends DashboardEvents {}

class StopRecordingEvent extends DashboardEvents {}

