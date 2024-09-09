part of 'navigator_shell.dart';

class NavigationRowCubit extends Cubit<String> {
  NavigationRowCubit() : super(navigationRowIconPaths.first);

  void goToRoute(String nextRoute) {
    switch (nextRoute) {
      case AssetStringPath.home:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.dashboard);
        break;
      case AssetStringPath.reminders:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.reminders);
        break;
      case AssetStringPath.emergency:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.emergency);
        break;
      case AssetStringPath.charts:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.charts);
        break;
      case AssetStringPath.settings:
        UtilHelpers.clearPreviousAndPushRoute(RouteNames.settings);
        break;
      default:
    }
    emit(nextRoute);
  }
}

final List<String> navigationRowIconPaths = <String>[
  AssetStringPath.home,
  AssetStringPath.reminders,
  AssetStringPath.emergency,
  AssetStringPath.charts,
  AssetStringPath.settings,
];
