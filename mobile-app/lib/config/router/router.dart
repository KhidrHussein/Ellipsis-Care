import 'package:ellipsis_care/src/features/dashboard/presentation/controller/cubit/dashboard_cubit.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/views/prompt_responses.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/views/recording_page.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/views/response_history.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/views/emergency_call.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/views/sos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../src/features/reminders/presentation/bloc/reminder_bloc.dart';
import 'route_names.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/forgot_password.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/signin.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/signup.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/verify_email.dart';
import 'package:ellipsis_care/src/features/charts/presentation/views/charts.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/views/dashboard.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/bloc/bloc.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/views/emergency.dart';
import 'package:ellipsis_care/src/features/onboarding/cubit/cubit.dart';
import 'package:ellipsis_care/src/features/onboarding/onboarding.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/views/reminders.dart';
import 'package:ellipsis_care/src/features/settings/presentation/views/settings.dart';
import 'package:ellipsis_care/src/shared/navigator_shell/navigator_shell.dart';

final GlobalKey<NavigatorState> _routerKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  navigatorKey: _routerKey,
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
          path: '/dashboard',
          name: RouteNames.dashboard,
          pageBuilder: (context, state) => MaterialPage<Dashboard>(
            child: BlocProvider(
              create: (context) => DashboardBloc(),
              child: const Dashboard(),
            ),
          ),
          routes: [
            GoRoute(
              path: 'response-history',
              name: RouteNames.responseHistory,
              parentNavigatorKey: _routerKey,
              pageBuilder: (context, state) => MaterialPage<ResponseHistory>(
                child: BlocProvider(
                  create: (context) => DashboardBloc(),
                  child: const ResponseHistory(),
                ),
              ),
            ),
            GoRoute(
              path: 'recording',
              name: RouteNames.recording,
              parentNavigatorKey: _routerKey,
              pageBuilder: (context, state) => MaterialPage<RecordingPage>(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => DashboardCubit()),
                    BlocProvider(create: (context) => DashboardBloc()),
                  ],
                  child: const RecordingPage(),
                ),
              ),
              routes: [
                GoRoute(
                  path: 'prompt-responses',
                  name: RouteNames.promptResponses,
                  pageBuilder: (context, state) =>
                      MaterialPage<PromptResponses>(
                    child: BlocProvider(
                      create: (context) => DashboardBloc(),
                      child: const PromptResponses(),
                    ),
                  ),
                ),
              ],
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
          pageBuilder: (context, state) => const MaterialPage<SosPage>(
            child: SosPage(),
          ),
          routes: [
            GoRoute(
              path: 'emergency',
              name: RouteNames.emergency,
              pageBuilder: (context, state) => MaterialPage<Emergency>(
                child: BlocProvider(
                  create: (context) => EmergencyContactBloc(),
                  child: const Emergency(),
                ),
              ),
              routes: [
                GoRoute(
                  path: 'emergency_call',
                  parentNavigatorKey: _routerKey,
                  name: RouteNames.emergencyCall,
                  pageBuilder: (context, state) => MaterialPage<EmergencyCall>(
                    child: BlocProvider(
                      create: (context) => EmergencyContactBloc(),
                      child: const EmergencyCall(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/charts',
          name: RouteNames.charts,
          pageBuilder: (context, state) => const MaterialPage<Charts>(
            child: Charts(),
          ),
        ),
        GoRoute(
          path: '/settings',
          name: RouteNames.settings,
          pageBuilder: (context, state) => const MaterialPage<Settings>(
            child: Settings(),
          ),
        ),
      ],
    )
  ],
);
