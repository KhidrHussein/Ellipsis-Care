import 'package:ellipsis_care/core/enums/api_state.dart';
import 'package:ellipsis_care/core/enums/reminder_options/reminder_options.dart';
import 'package:ellipsis_care/core/services/hive_storage_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/injector.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/meal/nutrition_card.dart';
import 'package:ellipsis_care/src/features/reminders/models/reminder_model.dart/reminder_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_events.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvents, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<AddToMealProgress>(_addToProgress);
    on<SubtractFromMealProgress>(_subtractFromProgress);
    on<GetMedications>(_getMedications);
    on<EditRoutineProgress>(_editRoutine);
  }

  final HiveStorageService _hiveStorageService = injector<HiveStorageService>();

  void _addToProgress(AddToMealProgress event, Emitter<DashboardState> emit) {
    if (state.mealProgress < 5) {
      emit(
        state.copyWith(mealProgress: (state.mealProgress + 1)),
      );
    }
  }

  void _subtractFromProgress(
      SubtractFromMealProgress event, Emitter<DashboardState> emit) {
    if (state.mealProgress > 0) {
      emit(
        state.copyWith(mealProgress: (state.mealProgress - 1)),
      );
    }
  }

  void _getMedications(
      GetMedications event, Emitter<DashboardState> emit) async {
    final reminders = await _hiveStorageService.getAllReminders();
    List<ReminderModel> medications = reminders
        .where((reminder) => reminder.type == ReminderType.drug)
        .toList();

    emit(state.copyWith(medications: medications));
  }

  void _editRoutine(EditRoutineProgress event, Emitter<DashboardState> emit) {
    emit(
      state.copyWith(
        routines: {...state.routines, event.schedule: event.hasPassed},
        medicationProgress: _getProgress(state.medicationProgress),
      ),
    );
  }

  int _getProgress(int progress) {
    for (bool value in state.routines.values) {
      if (value && progress >= 0) {
        progress += 1;
      }
      if(!value && progress > 0) {
        progress -= 1;
      }
    }
    return progress;
  }
}
