part of 'auth_bloc.dart';

sealed class AuthenticationState {}

class InitialState implements AuthenticationState {}

class LoadingState implements AuthenticationState {}

class AuthenticationFailed extends Equatable implements AuthenticationState {
  const AuthenticationFailed({this.error});
  final String? error;

  @override
  List<Object?> get props => [error];
}

class AuthenticationPassed<S> extends Equatable implements AuthenticationState {
  const AuthenticationPassed({this.data});
  final S? data;

  @override
  List<Object?> get props => [data];
}
