class CustomNotificationEventModel {
  const CustomNotificationEventModel({
    required this.title,
    required this.subTitle,
    required this.pathToAudioFile,
  });

  final String title;
  final String subTitle;
  final String pathToAudioFile;

  @override
  String toString() =>
      'CustomNotificationEventModel(title: $title, subTitle: $subTitle, pathToAudiFile: $pathToAudioFile)';
}
