part of 'navigator_shell.dart';

class NavigationRowCubit extends Cubit<String> {
  NavigationRowCubit() : super(navigationRowIconPaths.first);

  void goToRoute(String nextRoute) {
    switch (nextRoute) {
      case AssetStrings.home:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.dashboard);
        break;
      case AssetStrings.reminders:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.reminders);
        break;
      case AssetStrings.emergency:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.emergency);
        break;
      case AssetStrings.charts:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.charts);
        break;
      case AssetStrings.settings:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.settings);
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
  AssetStrings.charts,
  AssetStrings.settings,
];
