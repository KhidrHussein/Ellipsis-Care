import 'package:ellipsis_care/config/router/router.dart' show router;

class UtilHelpers {
  static void pushRoute(String routeName) {
    router.pushNamed(routeName);
  }

  static void clearPreviousAndPushRoute(String routeName) {
    router.goNamed(routeName);
  }

  static void popRoute() {
    router.pop();
  }
}
