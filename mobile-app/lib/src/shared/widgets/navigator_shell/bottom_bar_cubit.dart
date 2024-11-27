part of 'navigator_shell.dart';

class NavigationRowCubit extends Cubit<String> {
  NavigationRowCubit() : super(navigationRowIconPaths.first);

  void goToRoute(String nextRoute) {
    switch (nextRoute) {
      case AssetStrings.home:
        UtilHelpers.goTo(RouteNames.home);
        break;
      case AssetStrings.reminders:
        UtilHelpers.goTo(RouteNames.reminders);
        break;
      case AssetStrings.emergency:
        UtilHelpers.goTo(RouteNames.sos);
        break;
      case AssetStrings.dashboard:
        UtilHelpers.goTo(RouteNames.dashboard);
        break;
      case AssetStrings.settings:
        UtilHelpers.goTo(RouteNames.settings);
        break;
      default:
    }
    emit(nextRoute);
  }
}

final List<String> navigationRowIconPaths = <String>[
  AssetStrings.home,
  AssetStrings.reminders,
  AssetStrings.emergency,
  AssetStrings.dashboard,
  AssetStrings.settings,
];
