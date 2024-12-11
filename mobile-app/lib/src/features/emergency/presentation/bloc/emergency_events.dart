part of 'emergency_bloc.dart';

sealed class EmergencyEvents {}

class AddContactEvent implements EmergencyEvents {}

class FetchContactsEvent implements EmergencyEvents {}

class AlertContactsEvent implements EmergencyEvents {}

class EditContactEvent implements EmergencyEvents {
  EditContactEvent({required this.contact});

  final EmergencyContact contact;
}

class DeleteContactEvent implements EmergencyEvents {
  DeleteContactEvent({required this.id});

  final String id;
}
