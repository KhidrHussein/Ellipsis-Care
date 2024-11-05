part of 'reminder_bloc.dart';

sealed class ReminderState extends Equatable {
  const ReminderState({required this.selectedDate, required this.reminders});

  final DateTime selectedDate;
  final List<ReminderModel> reminders;

  @override
  List<Object?> get props => [selectedDate, reminders];

  @override
  bool? get stringify => true;
}

class InitialState extends ReminderState {
  InitialState() : super(selectedDate: DateTime.now(), reminders: []);
}

class CreatedReminder extends ReminderState {
  const CreatedReminder({
    required super.selectedDate,
    required super.reminders,
  });
}

class UpdatedDate extends ReminderState {
  const UpdatedDate({
    required super.selectedDate,
    required super.reminders,
  });
}
