import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarCubit extends Cubit<DateTime> {
  CalendarCubit() : super(DateTime.now());

  void updateDate(DateTime newDate) => emit(newDate);
}
