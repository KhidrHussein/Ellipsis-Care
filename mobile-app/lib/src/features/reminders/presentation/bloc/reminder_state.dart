part of 'reminder_bloc.dart';

class ReminderState extends Equatable {
  const ReminderState({
    this.error = "",
    this.spokenCommand = "",
    this.apiState = ApiState.none,
    this.hasInitializedVoiceCommand = false,
    this.calendarEvent = const {},
    required this.currentDate,
  });

  final String error;
  final String spokenCommand;
  final ApiState apiState;
  final DateTime currentDate;
  final bool hasInitializedVoiceCommand;
  final Map<DateTime, List<ReminderModel>> calendarEvent;

  ReminderState copyWith({
    String? error,
    String? spokenCommand,
    ApiState? apiState,
    DateTime? currentDate,
    bool? hasInitializedVoiceCommand,
    Map<DateTime, List<ReminderModel>>? calendarEvent,
  }) {
    return ReminderState(
      error: error ?? this.error,
      spokenCommand: spokenCommand ?? this.spokenCommand,
      apiState: apiState ?? this.apiState,
      currentDate: currentDate ?? this.currentDate,
      hasInitializedVoiceCommand:
          hasInitializedVoiceCommand ?? this.hasInitializedVoiceCommand,
      calendarEvent: calendarEvent ?? this.calendarEvent,
    );
  }

  @override
  List<Object> get props {
    return [
      error,
      spokenCommand,
      apiState,
      currentDate,
      hasInitializedVoiceCommand,
      calendarEvent,
    ];
  }
}
