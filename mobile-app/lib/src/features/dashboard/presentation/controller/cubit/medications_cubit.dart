import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationProgressCubit extends Cubit<Map<String, bool>> {
  MedicationProgressCubit()
      : super({
          "Morning": false,
          "Afternoon": false,
          "Night": false,
        });

  void hasPassedRoutine(String routine, bool hasPassed) {
    state[routine] = hasPassed;
    emit({...state});
  }

  int progress() {
    int amountCompleted = 0;

    for (bool value in state.values) {
      if (value) {
        amountCompleted += 1;
      }
    }

    return amountCompleted;
  }
}
