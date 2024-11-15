import 'package:ellipsis_care/core/services/notification_service.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../../../../../core/utils/enums/reminder.dart';
import '../../../models/reminder.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc()
      : _notificationService = injector<NotificationService>(),
        super(const InitialState(events: {})) {
    on<CreateReminderEvent>(_createReminder);
  }

  final NotificationService _notificationService;

  void _createReminder(
      CreateReminderEvent event, Emitter<ReminderState> handler) async {
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

    state.events.printLog();

    handler.call(
      ReminderCreatedState(events: {
        ...state.events,
        ...{
          event.eventDate: [...?state.events[event.eventDate], reminder]
        }
      }),
    );

    await _notificationService.createReminderNotification(event.name, null);
  }
}
