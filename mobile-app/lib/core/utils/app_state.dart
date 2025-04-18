// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'enums.dart';

abstract class AppState<T> extends Equatable {
  const AppState({
    required this.state,
    required this.message,
    required this.error,
    this.data,
  });

  final ApiState state;

  final String message;

  final String error;

  final T? data;

  @override
  List<Object?> get props => [data, error, message, state];

  @override
  bool get stringify => true;
}
