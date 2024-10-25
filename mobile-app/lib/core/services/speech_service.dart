import '../utils/extensions.dart';

import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText();

  Future<bool?> init() async {
    try {
      final bool hasPermission = await _speech.initialize(
        debugLogging: true,
        finalTimeout: const Duration(seconds: 30),
        onStatus: (status) {
          "$runtimeType $status".printLog();
        },
        onError: (errorNotification) {
          "$runtimeType ${errorNotification.errorMsg}".printLog();
        },
      );

      return hasPermission;
    } catch (e) {
      "$runtimeType Error: $e\n".printLog();
      return null;
    }
  }

  Future<void> listenAndConvertToWords(
      {required Function(String text) onResult}) async {
    try {
      if (_speech.isAvailable) {
        "$runtimeType Speech is available:${_speech.isAvailable}".printLog();
        await _speech.listen(
          onResult: (value) {
            // "$value".printLog();
            onResult(value.recognizedWords);
          },
        );
      }
    } catch (e) {
      "$runtimeType Error: $e\n".printLog();
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
