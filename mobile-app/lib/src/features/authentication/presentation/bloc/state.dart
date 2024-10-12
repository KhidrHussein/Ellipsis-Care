part of 'bloc.dart';

sealed class AuthenticationState {}

class DefaultState implements AuthenticationState {}

class LoadingState implements AuthenticationState {}

class AuthenticationFailed implements AuthenticationState {}

class AuthenticationPassed<S> extends Equatable implements AuthenticationState {
  const AuthenticationPassed({this.data});
  final S? data;

  @override
  List<Object?> get props => [data];
}
