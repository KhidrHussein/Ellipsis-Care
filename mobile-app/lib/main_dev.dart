import 'main.dart';

import 'firebase_options_dev.dart';

void main() async {
  await initializeApp(firebaseOptions:  DefaultFirebaseOptions.currentPlatform);
}
