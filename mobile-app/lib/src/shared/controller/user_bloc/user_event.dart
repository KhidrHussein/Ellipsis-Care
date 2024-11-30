part of 'user_bloc.dart';

sealed class UserEvent {}

class GetUserEvent extends UserEvent {}

class SaveUserEvent extends UserEvent {}

class DeleteUserEvent extends UserEvent {}

class UpdateUserInfoEvent extends UserEvent {
  UpdateUserInfoEvent({
    this.email,
    this.firstname,
    this.lastname,
    this.photoUrl,
  });

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? photoUrl;
}
