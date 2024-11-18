import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/notification_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:ellipsis_care/src/features/reminders/models/event.dart';

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
      reminderStartTime: event.eventStartTime!,
      reminderEndTime: event.eventEndTime!,
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

    String getActionVerbBasedOnReminderType = switch (event.type) {
      ReminderType.drug => "Take",
      ReminderType.food => "Eat"
    };

    String schehule() {
      String schedules = "";
      for (var i in event.schedule) {
        schedules = "${i.name},";
      }
      return schedules;
    }

    String craftNotificationContent =
        "$getActionVerbBasedOnReminderType ${event.dosage} "
        "${event.interval.name} daily"
        "every ${schehule()} at "
        "${event.eventStartTime!.hour}:${event.eventStartTime!.minute} "
        "${event.eventStartTime!.period.name}"
        "${event.instruction.instructionName}";

    await _notificationService.createReminderNotification(
      event: Event(
        name: event.name,
        content: craftNotificationContent,
        timeInHours: event.eventStartTime!.hour,
        timeInMinutes: event.eventStartTime!.minute,
        day: event.startDate!.day,
        month: event.startDate!.month,
        year: event.startDate!.year,
      ),
    );
  }
}
