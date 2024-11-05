import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums/reminder.dart';
import '../../../../../core/utils/locator.dart';
import '../../data/reminders_repository.dart';
import '../../models/reminder.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc()
      : _apiRepository = injector<ReminderRepository>(),
        super(InitialState()) {
    // on<FetchRemindersFromStorage>(_loadReminderEvents);
    on<CreateReminder>(_createReminder);
    on<SelectDate>(_updateSelectedDate);
  }

  final ReminderRepository _apiRepository;

  void _createReminder(CreateReminder event, Emitter<ReminderState> handler) {
    final ReminderModel reminder = ReminderModel(
      name: event.name,
      dosage: event.dosage,
      eventIsCompleted: false,
      type: event.type,
      instruction: event.instruction,
      schedule: event.schedule,
      interval: event.interval,
      startDate: event.startDate!,
      endDate: event.endDate!,
    );
    handler.call(
      CreatedReminder(
        selectedDate: state.selectedDate,
        reminders: [...state.reminders, reminder],
      ),
    );
  }

  void _updateSelectedDate(SelectDate event, Emitter<ReminderState> handler) {
    handler.call(
      UpdatedDate(
        selectedDate: event.newDate,
        reminders: state.reminders,
      ),
    );
  }
}
