part of 'dashboard_bloc.dart';

sealed class DashboardEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubtractFromMealProgress extends DashboardEvents {}

class AddToMealProgress extends DashboardEvents {}

class GetMedications extends DashboardEvents {}

class EditRoutineProgress extends DashboardEvents {
  EditRoutineProgress({required this.schedule, required this.hasPassed});

  final ReminderSchedule schedule;
  final bool hasPassed;

  @override
  List<Object?> get props => [schedule, hasPassed];
}

class PickHealthOptionEvent extends DashboardEvents {
  PickHealthOptionEvent({required this.option});

  final HealthOptions option;

  @override
  List<Object?> get props => [option];
}
