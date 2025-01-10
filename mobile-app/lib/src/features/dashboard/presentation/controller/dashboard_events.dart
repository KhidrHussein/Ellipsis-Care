part of 'dashboard_bloc.dart';

sealed class DashboardEvents {}

class SubtractFromMealProgress extends DashboardEvents {}

class AddToMealProgress extends DashboardEvents {}

class GetMedications extends DashboardEvents {}

class EditRoutineProgress extends DashboardEvents {
  final ReminderSchedule schedule;
  final bool hasPassed;

  EditRoutineProgress(this.schedule, this.hasPassed);
}
