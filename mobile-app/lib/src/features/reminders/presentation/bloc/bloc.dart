import '../../../../../core/services/storage_service.dart';
import '../../../../../core/utils/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums/reminder.dart';

part 'event.dart';
part 'state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc()
      : _storageService = injector<StorageService>(),
        super(NoReminder()) {
    on<FetchRemindersFromStorage>(_loadReminderEvents);
  }
  final StorageService _storageService;
  
  void _loadReminderEvents(
      FetchRemindersFromStorage event, Emitter<ReminderState> handler) {}
}
