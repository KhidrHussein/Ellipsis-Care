import 'package:ellipsis_care/core/services/storage_service.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:ellipsis_care/src/features/emergency/domain/emergency_contact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/contacts_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';

part 'events.dart';
part 'state.dart';

class EmergencyContactBloc
    extends Bloc<EmergencyContactEvent, EmergencyContactState> {
  EmergencyContactBloc()
      : _storageService = injector<StorageService>(),
        _phoneService = injector<PhoneContactService>(),
        super(NoContactState()) {
    on<FetchContactsFromStorageEvent>(_fetchContactsFromStorage);
    on<AddContactEvent>(_addContactToList);
  }

  final PhoneContactService _phoneService;
  final StorageService _storageService;

  void _fetchContactsFromStorage(FetchContactsFromStorageEvent event,
      Emitter<EmergencyContactState> handler) async {
    final contacts = await _storageService.getEmegencyContacts();

    if (contacts != null) {
      handler.call(
        HasContactState(contacts: [...contacts]),
      );

      "Fetched from Storage: $contacts".printLog();
    }
  }

  void _addContactToList(
      AddContactEvent event, Emitter<EmergencyContactState> handler) async {
    final selectedContact = await _phoneService.pickContact();

    if (selectedContact != null) {
      await _storageService.storeEmergencyContact(selectedContact);

      "Picked: $selectedContact".printLog();

      final contacts = await _storageService.getEmegencyContacts();

      if (contacts != null) {
        handler.call(
          HasContactState(contacts: [...state.contacts, selectedContact]),
        );
      }
    }
  }
}
