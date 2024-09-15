import 'package:equatable/equatable.dart';

abstract class ApiState {}

class Loading implements ApiState {}

class Data<S> extends Equatable implements ApiState {
  const Data({this.data});
  final S? data;

  @override
  List<Object?> get props => [data];
}

class Error<E> extends Equatable implements ApiState {
  const Error({this.error});
  final E? error;

  @override
  List<Object?> get props => [error];
}
