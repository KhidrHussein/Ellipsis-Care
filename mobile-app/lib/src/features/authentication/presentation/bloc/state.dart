part of 'bloc.dart';

sealed class AuthenticationState {}

class Loading implements AuthenticationState {}

class Data<S> extends Equatable implements AuthenticationState {
  const Data({this.data});
  final S? data;

  @override
  List<Object?> get props => [data];
}

class Error<E> extends Equatable implements AuthenticationState {
  const Error({this.error});
  final E? error;

  @override
  List<Object?> get props => [error];
}
