// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.data,
    this.error = '',
    this.mealProgress = 0,
    this.medicationProgress = 0,
    this.medications = const [],
    this.apiState = ApiState.none,
    this.routines = const {
      ReminderSchedule.morning: false,
      ReminderSchedule.afternoon: false,
      ReminderSchedule.evening: false,
    },
  });

  final dynamic data;
  final String error;
  final ApiState apiState;
  final int mealProgress;
  final int medicationProgress;
  final List<ReminderModel> medications;
  final Map<ReminderSchedule, bool> routines;

  DashboardState copyWith({
    dynamic data,
    String? error,
    ApiState? apiState,
    int? mealProgress,
    int? medicationProgress,
    List<ReminderModel>? medications,
    Map<ReminderSchedule, bool>? routines,
  }) {
    return DashboardState(
      data: data ?? this.data,
      error: error ?? this.error,
      apiState: apiState ?? this.apiState,
      mealProgress: mealProgress ?? this.mealProgress,
      medicationProgress: medicationProgress ?? this.medicationProgress,
      medications: medications ?? this.medications,
      routines: routines ?? this.routines,
    );
  }

  @override
  List<Object?> get props => [
        data,
        error,
        apiState,
        mealProgress,
        medications,
        routines,
        medicationProgress,
      ];
}
