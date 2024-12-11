import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/background_audio_handler.dart';
import 'package:ellipsis_care/core/services/hive_storage_service.dart';
import 'package:ellipsis_care/core/services/voice_command_service.dart';
import 'package:ellipsis_care/core/utils/enums/api_state.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/reminders/data/reminders_repository.dart';
import 'package:ellipsis_care/src/features/reminders/models/reminder_response.dart';

import '../../../../../core/api/exceptions/exceptions.dart';
import '../../../../../core/services/notification_service.dart';
import '../../../../../core/utils/enums/reminder_options/reminder_options.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/injector.dart';
import '../../models/reminder_model.dart/reminder_model.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(ReminderState(currentDate: DateTime.now())) {
    on<GetAllReminders>(_getAllReminders);
    on<CreateReminderEvent>(_createReminder);
    on<UpdateCurrentDateEvent>(_updateCurrentDate);
    on<EditReminderEvent>(_editReminder);
    on<InitializeVoiceCommandEvent>(_initializeVoiceCommand);
    on<ActivateVoiceCommandEvent>(_activateVoiceCommand);
  }
  final ReminderRepository _repository = injector<ReminderRepository>();
  final VoiceCommandService _voiceCommandService =
      injector<VoiceCommandService>();
  final NotificationService _notificationService =
      injector<NotificationService>();
  final BackgroundAudioService _backgroundAudioService =
      injector<BackgroundAudioService>();
  final HiveStorageService _storageService = injector<HiveStorageService>();

  void _getAllReminders(
      GetAllReminders event, Emitter<ReminderState> emit) async {
    await _storageService.getAllReminders().then((reminders) {
      emit(state.copyWith(reminders: reminders));
    }).onError((error, stackTrace) {
      emit(state.copyWith(error: "Could not fetch reminders."));
    });
  }

  void _editReminder(
      EditReminderEvent event, Emitter<ReminderState> emit) async {
    await _storageService.editReminder(event.reminder);
  }

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
          "start": UtilHelpers.getDateFromIsoString(event.startDate),
          "end": UtilHelpers.getDateFromIsoString(event.endDate),
        },
        "instruction": event.instruction.instructionName,
        "time": UtilHelpers.getTimeFromIsoString(event.startDate),
      }
    };

    emit(state.copyWith(apiState: ApiState.loading));

    try {
      final apiResponse = await _repository.createReminder(payload);
      apiResponse.fold(
        (cutomNotification) {
          _storeReminder(event);
          _createNotification(event, cutomNotification);
          emit(state.copyWith(apiState: ApiState.success));
        },
        (exception) {
          final errorMessage = AppExceptions.getErrorMessage(exception);
          emit(
            state.copyWith(apiState: ApiState.failed, error: errorMessage),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
            apiState: ApiState.failed, error: "Could not create reminder."),
      );
    }
  }

  void _storeReminder(CreateReminderEvent event) async {
    final reminder = ReminderModel(
      name: event.name,
      dosage: event.dosage,
      type: event.type,
      instruction: event.instruction,
      schedule: event.schedule,
      interval: event.interval,
      startDate: event.startDate,
      endDate: event.endDate,
      createdAt: event.createdAt,
    );
    await _storageService.storeReminder(reminder);
  }

  void _createNotification(
      CreateReminderEvent event, ReminderResponse response) async {
    try {
      final date = UtilHelpers.getDateFromIsoString(event.startDate);
      await _notificationService.createReminderNotification(
        title: response.title,
        desc: response.description,
        hours: int.parse(date.split(":")[0]),
        minute: int.parse(date.split(":")[1]),
      );

      // _backgroundAudioService.handler.setSource(
      //   DeviceFileSource(response.pathToAudioFile),
      // );
      // _backgroundAudioService.handler.play();
    } catch (e) {
      "${e.runtimeType}: $e".printLog();
    }
  }

  @override
  void onTransition(Transition<ReminderEvent, ReminderState> transition) {
    super.onTransition(transition);
    "\n$runtimeType $transition\n".printLog();
  }
}
