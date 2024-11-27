part of "emergency_bloc.dart";

sealed class EmergencyContactState extends Equatable {
  const EmergencyContactState({required this.contacts});

  final List<EmergencyContact> contacts;

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