part of "bloc.dart";

sealed class EmergencyContactState extends Equatable {
  const EmergencyContactState({required this.contacts});

  final List<PhoneContact> contacts;

  @override
  List<Object?> get props => [contacts];
}

class NoContactState extends EmergencyContactState {
  NoContactState() : super(contacts: []);

  @override
  List<Object?> get props => [contacts];
}

class HasContactState extends EmergencyContactState {
  const HasContactState({required super.contacts});

  @override
  List<Object?> get props => [contacts];
}
