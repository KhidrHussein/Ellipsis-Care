part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.error = "",
    this.apiState = ApiState.none,
    this.micState = MicrophoneState.none,
    this.aiResponses = const [],
  });

  final String error;
  final ApiState apiState;
  final MicrophoneState micState;
  final List<HomeResponse> aiResponses;

  HomeState copyWith({
    String? error,
    String? filePath,
    ApiState? apiState,
    MicrophoneState? micState,
    List<HomeResponse>? aiResponses,
  }) {
    return HomeState(
      error: error ?? this.error,
      apiState: apiState ?? this.apiState,
      micState: micState ?? this.micState,
      aiResponses: aiResponses ?? this.aiResponses,
    );
  }

  @override
  List<Object> get props {
    return [
      error,
      apiState,
      micState,
      aiResponses,
    ];
  }
}
