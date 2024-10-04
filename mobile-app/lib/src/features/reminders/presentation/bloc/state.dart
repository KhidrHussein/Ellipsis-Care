part of 'bloc.dart';

sealed class ReminderState {}

class NoReminder implements ReminderState {}

class CompletedReminders implements ReminderState {}
