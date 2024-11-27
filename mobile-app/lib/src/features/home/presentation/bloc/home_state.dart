part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.error = "",
    this.filePath = "",
    this.apiState = ApiState.none,
    this.micState = MicrophoneState.none,
    this.aiResponses = const [],
  });

  final String error;
  final String filePath;
  final ApiState apiState;
  final MicrophoneState micState;
  final List<DataFromAI> aiResponses;

  HomeState copyWith({
    String? error,
    String? filePath,
    ApiState? apiState,
    MicrophoneState? micState,
    List<DataFromAI>? aiResponses,
  }) {
    return HomeState(
      error: error ?? this.error,
      filePath: filePath ?? this.filePath,
      apiState: apiState ?? this.apiState,
      micState: micState ?? this.micState,
      aiResponses: aiResponses ?? this.aiResponses,
    );
  }

  @override
  List<Object> get props {
    return [
      error,
      filePath,
      apiState,
      micState,
      aiResponses,
    ];
  }
}
