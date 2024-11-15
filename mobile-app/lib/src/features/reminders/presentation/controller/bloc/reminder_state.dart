part of 'reminder_bloc.dart';

sealed class ReminderState extends Equatable {
  const ReminderState({required this.events});

  final Map<DateTime, List<ReminderModel>> events;

  @override
  List<Object?> get props => [events];

  @override
  bool? get stringify => true;
}

class InitialState extends ReminderState {
  const InitialState({required super.events});
}

class ReminderCreatedState extends ReminderState {
  const ReminderCreatedState({required super.events});
}
