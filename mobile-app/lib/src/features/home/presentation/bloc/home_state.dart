part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.error = "",
    this.apiState = ApiState.none,
    this.micState = MicrophoneState.none,
    this.responses = const [],
  });

  final String error;
  final ApiState apiState;
  final MicrophoneState micState;
  final List<HomeResponse> responses;

  HomeState copyWith({
    String? error,
    ApiState? apiState,
    MicrophoneState? micState,
    List<HomeResponse>? responses,
  }) {
    return HomeState(
      error: error ?? this.error,
      apiState: apiState ?? this.apiState,
      micState: micState ?? this.micState,
      responses: responses ?? this.responses,
    );
  }

  @override
  List<Object> get props {
    return [error, apiState, micState, responses];
  }
}
