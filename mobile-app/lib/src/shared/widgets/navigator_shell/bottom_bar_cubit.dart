part of 'navigator_shell.dart';

class NavigationRowCubit extends Cubit<InAppNavigationRoutes> {
  NavigationRowCubit() : super(InAppNavigationRoutes.home);

  void goToRoute(InAppNavigationRoutes nextRoute) {
    switch (nextRoute) {
      case InAppNavigationRoutes.home:
        UtilHelpers.goTo(RouteNames.home);
        break;
      case InAppNavigationRoutes.reminders:
        UtilHelpers.goTo(RouteNames.reminders);
        break;
      case InAppNavigationRoutes.emergency:
        UtilHelpers.goTo(RouteNames.sos);
        break;
      case InAppNavigationRoutes.dashboard:
        UtilHelpers.goTo(RouteNames.dashboard);
        break;
      case InAppNavigationRoutes.settings:
        UtilHelpers.goTo(RouteNames.settings);
        break;
    }
    emit(nextRoute);
  }
}
