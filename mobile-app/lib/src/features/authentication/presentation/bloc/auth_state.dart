part of 'auth_bloc.dart';

class AuthenticationState<T> extends Equatable {
  const AuthenticationState({
    this.data,
    this.error = "",
    this.isUsingOauth = false,
    this.apiState = ApiState.none,
  });
  
  final T? data;
  final String error;
  final bool isUsingOauth;
  final ApiState apiState;

  AuthenticationState<T> copyWith({
    T? data,
    String? error,
    bool? isUsingOauth,
    ApiState? apiState,
  }) {
    return AuthenticationState<T>(
      data: data ?? this.data,
      error: error ?? this.error,
      isUsingOauth: isUsingOauth ?? this.isUsingOauth,
      apiState: apiState ?? this.apiState,
    );
  }

  @override
  List<Object?> get props => [data, error, isUsingOauth, apiState];
}
