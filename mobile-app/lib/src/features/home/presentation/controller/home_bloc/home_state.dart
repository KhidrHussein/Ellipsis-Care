// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class InitialState extends HomeState {
  const InitialState();
}

final class LoadingState extends HomeState {
  const LoadingState();
}

final class UploadToAISuccessful<T> extends HomeState {
  final List<T>? result;
  const UploadToAISuccessful({this.result});

  @override
  List<Object?> get props => [result];

  @override
  bool get stringify => true;
}

final class UploadToAIFailed extends HomeState {
  final String? error;
  const UploadToAIFailed({this.error});

  @override
  List<Object?> get props => [error];

  @override
  bool get stringify => true;
}
