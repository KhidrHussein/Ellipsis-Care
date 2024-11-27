import 'package:speech_to_text/speech_recognition_result.dart';

import '../utils/extensions.dart';

import 'package:speech_to_text/speech_to_text.dart';

class VoiceCommandService {
  final SpeechToText _speech = SpeechToText();

  Future<bool?> init() async {
    try {
      final bool hasPermission = await _speech.initialize(
        debugLogging: true,
        finalTimeout: const Duration(seconds: 30),
        onStatus: (status) {
          "Status: $status".printLog();
        },
        onError: (errorNotification) {
          "Error: ${errorNotification.errorMsg}, type: ${errorNotification.permanent}"
              .printLog();
        },
      );

      return hasPermission;
    } catch (e) {
      "$runtimeType Error: $e\n".printLog();
      return null;
    }
  }

  Future<void> startListening(
      {void Function(SpeechRecognitionResult)? onResult}) async {
    try {
      await _speech.listen(
        onResult: onResult,
        listenFor: const Duration(seconds: 30),
      );
    } catch (e) {
      "$runtimeType Error: ${e.toString()}\n".printLog();
    }
  }

  Future<void> stopListening() async {
    try {
      await _speech.stop();
    } catch (e) {
      "$runtimeType Error: $e\n".printLog();
    }
  }
}
