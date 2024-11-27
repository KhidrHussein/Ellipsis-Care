import 'package:ellipsis_care/src/features/reminders/models/notification_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/voice_command_service.dart';
import 'package:ellipsis_care/core/utils/enums/api_state.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/reminders/data/reminders_repository.dart';

import '../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../core/services/notification_service.dart';
import '../../../../../core/utils/enums/reminder.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/locator.dart';
import '../../models/notification_event.dart';
import '../../models/reminder.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc()
      : _repository = injector<ReminderRepository>(),
        _voiceCommandService = injector<VoiceCommandService>(),
        _notificationService = injector<NotificationService>(),
        super(ReminderState(currentDate: DateTime.now())) {
    on<InitializeVoiceCommandEvent>(_initializeVoiceCommand);
    on<ActivateVoiceCommandEvent>(_activateVoiceCommand);
    on<UpdateCurrentDateEvent>(_updateCurrentDate);
    on<CreateReminderEvent>(_createReminder);
  }
  final ReminderRepository _repository;
  final VoiceCommandService _voiceCommandService;
  final NotificationService _notificationService;

  void _updateCurrentDate(
      UpdateCurrentDateEvent event, Emitter<ReminderState> emit) {
    emit(
      state.copyWith(currentDate: event.newDate),
    );
  }

  void _initializeVoiceCommand(
      InitializeVoiceCommandEvent event, Emitter<ReminderState> emit) async {
    final hasInitializedCommandService = await _voiceCommandService.init();
    emit(
      state.copyWith(hasInitializedVoiceCommand: hasInitializedCommandService),
    );
  }

  void _activateVoiceCommand(
      ActivateVoiceCommandEvent event, Emitter<ReminderState> emit) async {
    await _voiceCommandService.startListening(
      onResult: (spokenWords) {
        // spokenWords.printLog();
        if (spokenWords.finalResult) {
          spokenWords.printLog();
          emit(
            state.copyWith(spokenCommand: spokenWords.recognizedWords),
          );
        }
      },
    );
  }

  void _createReminder(
      CreateReminderEvent event, Emitter<ReminderState> emit) async {
    String schedule = "";

    for (var s in event.schedule) {
      schedule = schedule + s.scheduleName;
    }

    final payload = <String, dynamic>{
      "reminder": {
        "name": event.name,
        "type": event.type.name,
        "schedule": schedule,
        "interval": event.interval.intervalName,
        "dosage": event.dosage,
        "duration": {
          "start": UtilHelpers.dateFormatter3(event.startDate!),
          "end": UtilHelpers.dateFormatter3(event.endDate!),
        },
        "instruction": event.instruction.instructionName,
        "time": UtilHelpers.timeFormatter1(state.currentDate),
      }
    };

    emit(
      state.copyWith(apiState: ApiState.loading),
    );

    try {
      final apiResponse = await _repository.createReminder(payload);

      apiResponse.fold(
        (cutomNotification) {
          _createNotification(event, cutomNotification);
          cutomNotification.printLog();
        },
        (exception) {
          final errorMessage = AppExceptions.getErrorMessage(exception);
          emit(
            state.copyWith(apiState: ApiState.failed, error: errorMessage),
          );
        },
      );

      _emitReminderEvent(event, emit);
    } catch (e) {
      emit(
        state.copyWith(
            apiState: ApiState.failed, error: "Could not create reminder."),
      );
    }
  }

  void _emitReminderEvent(
      CreateReminderEvent event, Emitter<ReminderState> emit) {
    final reminder = ReminderModel(
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

    final newEvent = {
      state.currentDate: [...?state.calendarEvent[state.currentDate], reminder]
    };

    emit(
      state.copyWith(
        apiState: ApiState.success,
        calendarEvent: {...state.calendarEvent, ...newEvent},
      ),
    );
  }

  void _createNotification(CreateReminderEvent event,
      CustomNotificationEventModel notificationEvent) async {
    try {
      await _notificationService.createReminderNotification(
        notification: NotificationEvent(
          name: notificationEvent.title,
          content: notificationEvent.subTitle,
          eventTimeInHours: event.eventStartTime!.hour,
          eventTimeInMinutes: event.eventStartTime!.minute,
          customSoundFilePath: notificationEvent.pathToAudioFile,
        ),
      );
    } catch (e) {
      "${e.runtimeType}: $e".printLog();
    }
  }

  @override
  void onTransition(Transition<ReminderEvent, ReminderState> transition) {
    super.onTransition(transition);
    "$runtimeType $transition".printLog();
  }
}
