import 'package:ellipsis_care/core/services/location_service.dart';
import 'package:ellipsis_care/core/services/sms_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/enums/api_state.dart';
import 'package:intl/intl.dart';
import '../../../../../core/services/contacts_service.dart';
import '../../../../../core/services/hive_storage_service.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/injector.dart';
import '../../domain/emergency_contact.dart';

part 'emergency_events.dart';
part 'emergency_state.dart';

class EmergencyContactBloc extends Bloc<EmergencyEvents, EmergencyState> {
  EmergencyContactBloc() : super(const EmergencyState()) {
    on<AddContactEvent>(_addContactToList);
    on<EditContactEvent>(_editContact);
    on<FetchContactsEvent>(_fetchContacts);
    on<AlertContactsEvent>(_alertContacts);
    on<DeleteContactEvent>(_deleteContact);
  }

  final SmsService _smsService = injector<SmsService>();
  final PhoneContactService _phoneService = injector<PhoneContactService>();
  final HiveStorageService _hiveStorage = injector<HiveStorageService>();
  final LocationService _locationService = injector<LocationService>();

  void _fetchContacts(
      FetchContactsEvent event, Emitter<EmergencyState> emit) async {
    await _locationService.askForPermission();
    await _hiveStorage.getEmergencyContacts().then((value) {
      emit(state.copyWith(contacts: [...value]));
    });
  }

  void _editContact(
      EditContactEvent event, Emitter<EmergencyState> emit) async {
    await _hiveStorage
        .editContactInformation(event.contact)
        .then((value) async {
      await _hiveStorage.getEmergencyContacts().then((value) {
        emit(state.copyWith(contacts: [...value]));
      });
    });
  }

  void _alertContacts(
      AlertContactsEvent event, Emitter<EmergencyState> emit) async {
    List<String> numbers =
        state.contacts.map((contact) => contact.phoneNumber!).toList();

    if (state.contacts.isEmpty) return;

    try {
      String sosMessage =
          "I am having an emergency. Call me!. Sent via Ellipsis Care App.";

      await _smsService.sendSms(numbers.first, sosMessage);
    } catch (e) {
      emit(
        state.copyWith(
          apiState: ApiState.failed,
          error: "Could not send message. Please try again.",
        ),
      );
    }
  }

  void _deleteContact(
      DeleteContactEvent event, Emitter<EmergencyState> emit) async {
    await _hiveStorage.deleteEmergencyContact(event.id).then((value) async {
      await _hiveStorage.getEmergencyContacts().then((value) {
        emit(state.copyWith(contacts: [...value]));
      });
    });
  }

  void _addContactToList(
      AddContactEvent event, Emitter<EmergencyState> emit) async {
    emit(state.copyWith(apiState: ApiState.loading));

    try {
      final contact = await _phoneService.pickContact();
      await _hiveStorage.storeEmergencyContact(contact);

      final newContactList = await _hiveStorage.getEmergencyContacts();
      emit(
        state.copyWith(apiState: ApiState.success, contacts: newContactList),
      );
    } catch (e) {
      emit(
        state.copyWith(
          apiState: ApiState.failed,
          error: "Could not add contact. Please try again.",
        ),
      );
    }
  }

  @override
  void onChange(Change<EmergencyState> change) {
    super.onChange(change);
    "$runtimeType ${change.currentState}\n".printLog();
  }
}
