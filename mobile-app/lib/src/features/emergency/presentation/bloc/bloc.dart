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
      : _service = injector<PhoneContactService>(),
        super(NoContactState()) {
    // on<AddMultipleContactsEvent>(_addMultipleContactsToList);
    on<AddContactEvent>(_addContactToList);
  }

  final PhoneContactService _service;

  // void _addMultipleContactsToList(AddMultipleContactsEvent event,
  //     Emitter<EmergencyContactState> handler) async {
  //   final selectedContacts = await _service.pickContacts();
  //   "Picked: $selectedContacts, \nCurrent State: $state".printLog();
  //   handler.call(
  //     HasContactState(contacts: [...state.contacts, ...?selectedContacts]),
  //   );
  // }

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
