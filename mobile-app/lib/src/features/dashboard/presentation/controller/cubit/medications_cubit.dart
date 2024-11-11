import 'package:flutter_bloc/flutter_bloc.dart';

class MedicationProgressCubit extends Cubit<int> {
  MedicationProgressCubit() : super(0);

  void incrementProgress() => emit(state + 1);

  void decrementProgress() => emit(state - 1);
}
