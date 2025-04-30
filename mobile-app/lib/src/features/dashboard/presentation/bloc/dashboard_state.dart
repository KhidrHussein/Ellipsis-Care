// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

class DashboardState<T> extends AppState {
  const DashboardState({
    super.data,
    super.error = "",
    super.message = "",
    super.state = ApiState.none,
    this.mealProgress = 0,
    this.medicationProgress = 0,
    this.healthOption = HealthOptions.bloodPressure,
    this.medications = const [],
    this.routines = const {
      ReminderSchedule.morning: false,
      ReminderSchedule.afternoon: false,
      ReminderSchedule.evening: false,
    },
  });

  final int mealProgress;
  final int medicationProgress;
  final HealthOptions healthOption;
  final List<ReminderModel> medications;
  final Map<ReminderSchedule, bool> routines;

  DashboardState<T> copyWith({
    T? data,
    ApiState? state,
    String? error,
    int? mealProgress,
    int? medicationProgress,
    HealthOptions? healthOption,
    List<ReminderModel>? medications,
    Map<ReminderSchedule, bool>? routines,
  }) {
    return DashboardState<T>(
      data: data ?? this.data,
      error: error ?? this.error,
      state: state ?? this.state,
      mealProgress: mealProgress ?? this.mealProgress,
      medicationProgress: medicationProgress ?? this.medicationProgress,
      healthOption: healthOption ?? this.healthOption,
      medications: medications ?? this.medications,
      routines: routines ?? this.routines,
    );
  }

  @override
  List<Object?> get props => [
        data,
        error,
        state,
        mealProgress,
        medicationProgress,
        healthOption,
        medications,
        routines,
      ];
}
