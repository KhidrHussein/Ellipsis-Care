// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthenticationState<T> extends AppState {
  const AuthenticationState({
    super.data,
    super.error = "",
    super.message = "",
    super.state = ApiState.none,
  });

  AuthenticationState<T> copyWith({
    T? data,
    String? message,
    String? error,
    ApiState? state,
  }) {
    return AuthenticationState<T>(
      data: data ?? this.data,
      message: message ?? this.message,
      error: error ?? this.error,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [data, error, message, state];
}
