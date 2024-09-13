import 'package:ellipsis_care/core/services/contacts_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

part 'events.dart';
part 'state.dart';

class EmergencyContactBloc
    extends Bloc<EmergencyContactEvent, EmergencyContactState> {
  EmergencyContactBloc()
      : _service = EmergencyContactsService.instance,
        super(NoContactState()) {
    on<AddMultipleContactsEvent>(_addMultipleContactsToList);
    on<AddContactEvent>(_addContactToList);
  }

  final EmergencyContactsService _service;

  void _addMultipleContactsToList(AddMultipleContactsEvent event,
      Emitter<EmergencyContactState> handler) async {
    final selectedContacts = await _service.pickContacts();
    "Picked: $selectedContacts, \nCurrent State: $state".printLog();
    handler.call(
      HasContactState(contacts: [...state.contacts, ...?selectedContacts]),
    );
  }

  void _addContactToList(
      AddContactEvent event, Emitter<EmergencyContactState> handler) async {
    final selectedContact = await _service.pickContact();
    if (selectedContact != null) {
      "Picked: $selectedContact, \nCurrent State: ${state.contacts}".printLog();
      handler.call(
        HasContactState(contacts: [...state.contacts, selectedContact]),
      );
    }
  }
}
