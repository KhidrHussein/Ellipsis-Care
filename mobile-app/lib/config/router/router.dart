import 'package:ellipsis_care/core/services/hive_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logman/logman.dart';

import '../../core/utils/injector.dart';
import '../../src/features/authentication/presentation/view/forgot_password.dart';
import '../../src/features/authentication/presentation/view/signin.dart';
import '../../src/features/authentication/presentation/view/signup.dart';
import '../../src/features/authentication/presentation/view/verify_email.dart';
import '../../src/features/dashboard/presentation/views/add_data.dart';
import '../../src/features/dashboard/presentation/views/chart_details.dart';
import '../../src/features/dashboard/presentation/views/dashboard.dart';
import '../../src/features/emergency/presentation/views/emergency_call.dart';
import '../../src/features/emergency/presentation/views/sos.dart';
import '../../src/features/home/presentation/views/home.dart';
import '../../src/features/home/presentation/views/recording_page.dart';
import '../../src/features/home/presentation/views/response_history.dart';
import '../../src/features/onboarding/onboarding.dart';
import '../../src/features/reminders/presentation/views/reminders.dart';
import '../../src/features/settings/presentation/views/settings.dart';
import '../../src/features/settings/presentation/views/sub_view/change_password.dart';
import '../../src/features/settings/presentation/views/sub_view/compliance_score.dart';
import '../../src/features/settings/presentation/views/sub_view/faq.dart';
import '../../src/features/settings/presentation/views/sub_view/legal.dart';
import '../../src/features/settings/presentation/views/sub_view/privacy_policy.dart';
import '../../src/features/settings/presentation/views/sub_view/profile.dart';
import '../../src/features/settings/presentation/views/sub_view/terms_of_use.dart';
import '../../src/shared/widgets/navigator_shell/navigator_shell.dart';
import 'route_names.dart';

final GlobalKey<NavigatorState> _mainRouterKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  debugLogDiagnostics: true,
  navigatorKey: _mainRouterKey,
  observers: [LogmanNavigatorObserver()],
  redirect: (context, state) async {
    final user = await injector<HiveStorageService>().getUser();
    final appSession = await injector<HiveStorageService>().getAppSession();

    final isNavigatingToPeerRoutes =
        state.matchedLocation.startsWith('/sign-up') ||
            state.matchedLocation.startsWith('/sign-in') ||
            state.matchedLocation.startsWith('/forgot-password');

    final isNavigatingToShellRoute =
        state.matchedLocation.startsWith('/home') ||
            state.matchedLocation.startsWith('/reminders') ||
            state.matchedLocation.startsWith('/sos') ||
            state.matchedLocation.startsWith('/dashboard') ||
            state.matchedLocation.startsWith('/settings');

    // Determine redirection conditions
    final bool redirectToOnboarding = appSession?.hasUserOnboard != true;
    final bool redirectToSignUp = appSession?.hasUserOnboard == true &&
        (user?.email == null || user?.email?.isEmpty == true);
    final bool redirectToHome = appSession?.hasUserOnboard == true &&
        appSession?.isLoggedIn == true &&
        user?.email?.isNotEmpty == true;

    // Redirect logic
    if (redirectToOnboarding && state.matchedLocation != '/') {
      return '/';
    } else if (redirectToSignUp &&
        !isNavigatingToShellRoute &&
        !isNavigatingToPeerRoutes) {
      return '/sign-up';
    } else if (redirectToHome && !isNavigatingToShellRoute) {
      return '/home';
    }
    // Allow navigation within shell routes
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.onboarding,
      pageBuilder: (context, state) {
        return const MaterialPage<Onboarding>(
          child: Onboarding(),
        );
      },
    ),
    GoRoute(
      path: '/sign-up',
      name: RouteNames.signup,
      pageBuilder: (context, state) => const MaterialPage<Signup>(
        child: Signup(),
      ),
    ),
    GoRoute(
      path: '/sign-in',
      name: RouteNames.signIn,
      pageBuilder: (context, state) => const MaterialPage<Signin>(
        child: Signin(),
      ),
    ),
    GoRoute(
      path: '/verify-email/:email',
      name: RouteNames.verifyEmail,
      pageBuilder: (context, state) => MaterialPage<VerifyEmail>(
        child: VerifyEmail(
          email: Uri.decodeComponent(state.pathParameters["email"] ?? ""),
        ),
      ),
    ),
    GoRoute(
      path: '/forgot-password',
      name: RouteNames.forgotPassword,
      pageBuilder: (context, state) => const MaterialPage<ForgotPassword>(
        child: ForgotPassword(),
      ),
    ),
    ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) {
        return NavigatorShell(routerState: state, child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          name: RouteNames.home,
          pageBuilder: (context, state) => const MaterialPage<Home>(
            child: Home(),
          ),
          routes: [
            GoRoute(
              path: 'response-history',
              name: RouteNames.responseHistory,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) =>
                  const MaterialPage<ResponseHistory>(
                child: ResponseHistory(),
              ),
            ),
            GoRoute(
              path: 'recording',
              name: RouteNames.recording,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) =>
                  const MaterialPage<RecordingPage>(
                child: RecordingPage(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/reminders',
          name: RouteNames.reminders,
          pageBuilder: (context, state) => const MaterialPage<Reminders>(
            child: Reminders(),
          ),
        ),
        GoRoute(
          path: '/sos',
          name: RouteNames.sos,
          pageBuilder: (context, state) => const MaterialPage<SosPage>(
            child: SosPage(),
          ),
          routes: [
            GoRoute(
              path: 'emergency_call',
              name: RouteNames.callEmergencyContacts,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) =>
                  const MaterialPage<EmergencyCall>(
                child: EmergencyCall(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/dashboard',
          name: RouteNames.dashboard,
          pageBuilder: (context, state) => const MaterialPage<Dashboard>(
            child: Dashboard(),
          ),
          routes: [
            GoRoute(
              path: 'chart-details',
              name: RouteNames.chartDetails,
              pageBuilder: (context, state) => const MaterialPage<ChartDetails>(
                child: ChartDetails(),
              ),
              routes: [
                GoRoute(
                  path: 'add-data',
                  name: RouteNames.addData,
                  pageBuilder: (context, state) => const MaterialPage<AddData>(
                    child: AddData(),
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          name: RouteNames.settings,
          pageBuilder: (context, state) => const MaterialPage<Settings>(
            child: Settings(),
          ),
          routes: [
            GoRoute(
              path: 'compliance-score',
              name: RouteNames.complianceScore,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) =>
                  const MaterialPage<ComplianceScore>(
                child: ComplianceScore(),
              ),
            ),
            GoRoute(
              path: 'profile',
              name: RouteNames.profile,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) => const MaterialPage<Profile>(
                child: Profile(),
              ),
            ),
            GoRoute(
              path: 'change-password',
              name: RouteNames.changePassword,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) =>
                  const MaterialPage<ChangePassword>(
                child: ChangePassword(),
              ),
            ),
            GoRoute(
              path: 'faq',
              name: RouteNames.faq,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) => const MaterialPage<Faq>(
                child: Faq(),
              ),
            ),
            GoRoute(
              path: 'privacy-policy',
              name: RouteNames.privacyPolicy,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) =>
                  const MaterialPage<PrivacyPolicy>(
                child: PrivacyPolicy(),
              ),
            ),
            GoRoute(
              path: 'terms-of-use',
              name: RouteNames.termsOfUse,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) => const MaterialPage<TermsOfUse>(
                child: TermsOfUse(),
              ),
            ),
            GoRoute(
              path: 'legal',
              name: RouteNames.legal,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) => const MaterialPage<Legal>(
                child: Legal(),
              ),
            ),
          ],
        ),
      ],
    )
  ],
);
