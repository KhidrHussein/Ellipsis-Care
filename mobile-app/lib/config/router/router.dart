import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:ellipsis_care/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/forgot_password.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/signin.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/signup.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/verify_email.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/views/dashboard.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/bloc/emergency_bloc.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/views/emergency_call.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/views/sos.dart';
import 'package:ellipsis_care/src/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:ellipsis_care/src/features/home/presentation/controller/cubit/dashboard_cubit.dart';
import 'package:ellipsis_care/src/features/home/presentation/views/home.dart';
import 'package:ellipsis_care/src/features/home/presentation/views/prompt_responses.dart';
import 'package:ellipsis_care/src/features/home/presentation/views/recording_page.dart';
import 'package:ellipsis_care/src/features/home/presentation/views/response_history.dart';
import 'package:ellipsis_care/src/features/onboarding/cubit/cubit.dart';
import 'package:ellipsis_care/src/features/onboarding/onboarding.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/views/reminders.dart';
import 'package:ellipsis_care/src/features/settings/presentation/views/settings.dart';
import 'package:ellipsis_care/src/features/settings/presentation/views/sub_view/change_password.dart';
import 'package:ellipsis_care/src/features/settings/presentation/views/sub_view/faq.dart';
import 'package:ellipsis_care/src/features/settings/presentation/views/sub_view/legal.dart';
import 'package:ellipsis_care/src/features/settings/presentation/views/sub_view/privacy_policy.dart';
import 'package:ellipsis_care/src/features/settings/presentation/views/sub_view/profile.dart';
import 'package:ellipsis_care/src/features/settings/presentation/views/sub_view/terms_of_use.dart';
import 'package:ellipsis_care/src/shared/navigator_shell/navigator_shell.dart';

import '../../src/features/reminders/presentation/bloc/reminder_bloc.dart';
import '../../src/features/settings/presentation/views/sub_view/compliance_score.dart';
import 'route_names.dart';

final GlobalKey<NavigatorState> _mainRouterKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  navigatorKey: _mainRouterKey,
  debugLogDiagnostics: true,
  redirect: (context, state) async {
    // final userDataSession = await injector<StorageService>().getUserData();
    // if (userDataSession!.hasViewedOnboarding) {
    //   return '/dashboard';
    // }

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.onboarding,
      pageBuilder: (context, state) {
        return MaterialPage<Onboarding>(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => OnboardingCubit()),
              BlocProvider(
                create: (context) => EmergencyContactBloc(),
              )
            ],
            child: const Onboarding(),
          ),
        );
      },
    ),
    GoRoute(
      path: '/sign-up',
      name: RouteNames.signup,
      pageBuilder: (context, state) => MaterialPage<Signup>(
        child: BlocProvider(
          create: (context) => AuthenticationBloc(),
          child: const Signup(),
        ),
      ),
    ),
    GoRoute(
      path: '/sign-in',
      name: RouteNames.signIn,
      pageBuilder: (context, state) => MaterialPage<Signin>(
        child: BlocProvider(
          create: (context) => AuthenticationBloc(),
          child: const Signin(),
        ),
      ),
      routes: [
        GoRoute(
          path: 'verify-email/:email',
          name: RouteNames.verifyEmail,
          pageBuilder: (context, state) => MaterialPage<VerifyEmail>(
            child: BlocProvider(
              create: (context) => AuthenticationBloc(),
              child: VerifyEmail(
                email: Uri.decodeComponent(state.pathParameters["email"] ?? ""),
              ),
            ),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/forgot-password',
      name: RouteNames.forgotPassword,
      pageBuilder: (context, state) => MaterialPage<ForgotPassword>(
        child: BlocProvider(
          create: (context) => AuthenticationBloc(),
          child: const ForgotPassword(),
        ),
      ),
    ),
    ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) {
        return BlocProvider(
          create: (context) => NavigationRowCubit(),
          child: NavigatorShell(routerState: state, child: child),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          name: RouteNames.home,
          pageBuilder: (context, state) => MaterialPage<Home>(
            child: BlocProvider(
              create: (context) => HomeBloc(),
              child: const Home(),
            ),
          ),
          routes: [
            GoRoute(
              path: 'prompt-responses',
              name: RouteNames.promptResponses,
              pageBuilder: (context, state) => MaterialPage<PromptResponses>(
                child: BlocProvider(
                  create: (context) => HomeBloc(),
                  child: const PromptResponses(),
                ),
              ),
            ),
            GoRoute(
              path: 'response-history',
              name: RouteNames.responseHistory,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) => MaterialPage<ResponseHistory>(
                child: BlocProvider(
                  create: (context) => HomeBloc(),
                  child: const ResponseHistory(),
                ),
              ),
            ),
            GoRoute(
              path: 'recording',
              name: RouteNames.recording,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) => MaterialPage<RecordingPage>(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => DashboardCubit()),
                    BlocProvider(create: (context) => HomeBloc()),
                  ],
                  child: const RecordingPage(),
                ),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/reminders',
          name: RouteNames.reminders,
          pageBuilder: (context, state) => MaterialPage<Reminders>(
            child: BlocProvider(
              create: (context) => ReminderBloc(),
              child: const Reminders(),
            ),
          ),
        ),
        GoRoute(
          path: '/sos',
          name: RouteNames.sos,
          pageBuilder: (context, state) => MaterialPage<SosPage>(
            child: BlocProvider(
              create: (context) => EmergencyContactBloc(),
              child: const SosPage(),
            ),
          ),
          routes: [
            GoRoute(
              path: 'emergency_call',
              name: RouteNames.callEmergencyContacts,
              parentNavigatorKey: _mainRouterKey,
              pageBuilder: (context, state) => MaterialPage<EmergencyCall>(
                child: BlocProvider(
                  create: (context) => EmergencyContactBloc(),
                  child: const EmergencyCall(),
                ),
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
