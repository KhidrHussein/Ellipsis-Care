import 'package:equatable/equatable.dart';

sealed class AppState {}

class Loading implements AppState {}

class Data<S> extends Equatable implements AppState {
  const Data({this.data});
  final S? data;

  @override
  List<Object?> get props => [data];
}

class Error<E> extends Equatable implements AppState {
  const Error({this.error});
  final E? error;

  @override
  List<Object?> get props => [error];
}
