part of 'user_bloc.dart';

sealed class UserEvent {}

class GetUserEvent extends UserEvent {}

class DeleteUserEvent extends UserEvent {}
