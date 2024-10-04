part of 'bloc.dart';

sealed class EmergencyContactEvent {}

class AddContactEvent implements EmergencyContactEvent {}

class FetchContactsFromStorageEvent implements EmergencyContactEvent {}
