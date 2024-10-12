class SpeechCommands {
  static final List<String> commands = [addReminder, startAI];

  static const addReminder = 'add a reminder', startAI = 'start AI';
}

class Utils {
  static String _executeCommand({
    required String text,
    required String command,
  }) {
    final commandIndex = text.indexOf(command);
    final finalIndex = commandIndex + command.length;

    if (commandIndex == -1) {
      return '';
    } else {
      return text.substring(finalIndex).trim();
    }
  }

  static void addReminder(String event) async {
    
  }

  static void scanVoicedText(String voicedText) {
    final text = voicedText.toLowerCase();

    if (text.contains(SpeechCommands.addReminder)) {
      final body =
          _executeCommand(text: text, command: SpeechCommands.addReminder);
      addReminder(body);

    } else if (text.contains(SpeechCommands.startAI)) {
      final url1 = _executeCommand(text: text, command: SpeechCommands.startAI);
      // TODO: Add a function to listen to the backend
    }
  }
}
