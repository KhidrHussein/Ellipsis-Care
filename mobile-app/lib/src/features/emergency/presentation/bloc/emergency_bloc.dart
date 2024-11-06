import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/contacts_service.dart';
import '../../../../../core/services/storage_service.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/locator.dart';
import '../../domain/emergency_contact.dart';

part 'emergency_events.dart';
part 'emergency_state.dart';

class EmergencyContactBloc
    extends Bloc<EmergencyContactEvent, EmergencyContactState> {
  EmergencyContactBloc()
      : _storageService = injector<StorageService>(),
        _phoneService = injector<PhoneContactService>(),
        super(NoContactState()) {
    on<AddContactEvent>(_addContactToList);
    on<FetchContactsEvent>(_fetchContacts);
    on<EditContactEvent>(_editContact);
    on<DeleteContactEvent>(_deleteContact);
  }

  final PhoneContactService _phoneService;
  final StorageService _storageService;

  void _fetchContacts(
      FetchContactsEvent event, Emitter<EmergencyContactState> handler) async {
    final contacts = await _storageService.getEmergencyContacts();

    if (contacts != null) {
      handler.call(
        HasContactState(contacts: [...contacts]),
      );

      "Fetched from Storage: $contacts".printLog();
    }
  }

  void _editContact(
      EditContactEvent event, Emitter<EmergencyContactState> handler) async {
    await _storageService.editContactInformation(event.contact);

    "Edited ${event.contact}".printLog();

    final contacts = await _storageService.getEmergencyContacts();

    if (contacts != null) {
      handler.call(
        HasContactState(contacts: [...contacts]),
      );
    }
  }

  void _deleteContact(
      DeleteContactEvent event, Emitter<EmergencyContactState> handler) async {
    await _storageService.deleteEmergencyContact(event.id);

    "Deleted ${event.id}".printLog();

    final contacts = await _storageService.getEmergencyContacts();

    if (contacts != null) {
      handler.call(
        HasContactState(contacts: [...contacts]),
      );
    }
  }

  void _addContactToList(
      AddContactEvent event, Emitter<EmergencyContactState> handler) async {
    final selectedContact = await _phoneService.pickContact();

    if (selectedContact != null) {
      await _storageService.storeEmergencyContact(selectedContact);

      "Picked: $selectedContact".printLog();

      final contacts = await _storageService.getEmergencyContacts();

      if (contacts != null) {
        handler.call(
          HasContactState(contacts: [...state.contacts, selectedContact]),
        );
      }
    }
  }
}
