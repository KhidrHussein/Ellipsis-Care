// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "emergency_bloc.dart";

class EmergencyState extends Equatable {
  const EmergencyState({
    this.error,
    this.contacts = const [],
    this.apiState = ApiState.none,
  });
  final String? error;
  final ApiState apiState;
  final List<EmergencyContact> contacts;

  EmergencyState copyWith({
    String? error,
    ApiState? apiState,
    List<EmergencyContact>? contacts,
  }) {
    return EmergencyState(
      error: error ?? this.error,
      apiState: apiState ?? this.apiState,
      contacts: contacts ?? this.contacts,
    );
  }

  @override
  List<Object?> get props => [error, apiState, contacts];
}
