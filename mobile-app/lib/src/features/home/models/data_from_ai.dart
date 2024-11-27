class DataFromAI {
  const DataFromAI({
    required this.aiResponse,
    required this.transcription,
    required this.pathToAudiFile,
  });

  final List<String> aiResponse;
  final List<String> transcription;
  final String pathToAudiFile;

  @override
  String toString() =>
      'DataFromAI(aiResponse: $aiResponse, transcription: $transcription, pathToAudioFile: $pathToAudiFile)';
}
