import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/storage_service.dart';
import '../../../../../core/utils/enums/reminder.dart';
import '../../../../../core/utils/locator.dart';
import '../../domain/reminder.dart';

part 'event.dart';
part 'state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc()
      : _storageService = injector<StorageService>(),
        super(InitialState()) {
    // on<FetchRemindersFromStorage>(_loadReminderEvents);
    on<CreateReminder>(_createReminder);
  }
  // ignore: unused_field
  final StorageService _storageService;

  // void _loadReminderEvents(
  //     FetchRemindersFromStorage event, Emitter<ReminderState> handler) {}

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
}
