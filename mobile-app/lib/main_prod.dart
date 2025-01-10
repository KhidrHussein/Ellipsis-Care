import 'package:ellipsis_care/main.dart';

import 'firebase_options_prod.dart';

void main() async {
  await initializeApp(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
}
