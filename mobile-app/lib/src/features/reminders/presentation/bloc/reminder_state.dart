// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reminder_bloc.dart';

class ReminderState extends Equatable {
  const ReminderState({
    this.error = "",
    this.spokenCommand = "",
    this.reminders = const [],
    this.apiState = ApiState.none,
    this.hasInitializedVoiceCommand = false,
    required this.currentDate,
  });

  final String error;
  final String spokenCommand;
  final ApiState apiState;
  final DateTime currentDate;
  final bool hasInitializedVoiceCommand;
  final List<ReminderModel> reminders;

  ReminderState copyWith({
    String? error,
    String? spokenCommand,
    ApiState? apiState,
    DateTime? currentDate,
    bool? hasInitializedVoiceCommand,
    List<ReminderModel>? reminders,
  }) {
    return ReminderState(
      error: error ?? this.error,
      spokenCommand: spokenCommand ?? this.spokenCommand,
      apiState: apiState ?? this.apiState,
      currentDate: currentDate ?? this.currentDate,
      hasInitializedVoiceCommand:
          hasInitializedVoiceCommand ?? this.hasInitializedVoiceCommand,
      reminders: reminders ?? this.reminders,
    );
  }

  @override
  List<Object> get props {
    return [
      error,
      spokenCommand,
      apiState,
      currentDate,
      reminders,
      hasInitializedVoiceCommand,
    ];
  }

  @override
  bool get stringify => true;
}
