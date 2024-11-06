part of 'emergency_bloc.dart';

sealed class EmergencyContactEvent {}

class AddContactEvent implements EmergencyContactEvent {}

class FetchContactsEvent implements EmergencyContactEvent {}

class EditContactEvent implements EmergencyContactEvent {
  EditContactEvent({required this.contact});

  final EmergencyContact contact;
}

class DeleteContactEvent implements EmergencyContactEvent {
  DeleteContactEvent({required this.id});

  final String id;
}
