import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/forgot_password.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/signin.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/signup.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/verify_email.dart';
import 'package:ellipsis_care/src/features/charts/presentation/views/charts.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/views/dashboard.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/bloc/bloc.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/views/emergency.dart';
import 'package:ellipsis_care/src/features/onboarding/cubit/cubit.dart';
import 'package:ellipsis_care/src/features/onboarding/onboarding.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/views/reminders.dart';
import 'package:ellipsis_care/src/features/settings/presentation/views/settings.dart';
import 'package:ellipsis_care/src/shared/navigator_shell/navigator_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _routerKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  navigatorKey: _routerKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.onboarding,
      pageBuilder: (context, state) {
        return MaterialPage<Onboarding>(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => OnboardingCubit()),
              BlocProvider(create: (context) => EmergencyContactBloc())
            ],
            child: const Onboarding(),
          ),
        );
      },
    ),
    GoRoute(
      path: '/sign-up',
      name: RouteNames.signup,
      pageBuilder: (context, state) =>
          const MaterialPage<Signup>(child: Signup()),
    ),
    GoRoute(
      path: '/sign-in',
      name: RouteNames.signIn,
      pageBuilder: (context, state) =>
          const MaterialPage<Signin>(child: Signin()),
      routes: [
        GoRoute(
          path: 'verify-email',
          name: RouteNames.verifyEmail,
          pageBuilder: (context, state) =>
              const MaterialPage<VerifyEmail>(child: VerifyEmail()),
        ),
      ],
    ),
    GoRoute(
      path: '/forgot-password',
      name: RouteNames.forgotPassword,
      pageBuilder: (context, state) =>
          const MaterialPage<ForgotPassword>(child: ForgotPassword()),
    ),
    ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) {
        return BlocProvider(
          create: (context) => NavigationRowCubit(),
          child: NavigatorShell(child: child),
        );
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          name: RouteNames.dashboard,
          pageBuilder: (context, state) => const MaterialPage<Dashboard>(
            child: Dashboard(),
          ),
        ),
        GoRoute(
          path: '/reminders',
          name: RouteNames.reminders,
          pageBuilder: (context, state) => const MaterialPage<Reminders>(
            child: Reminders(),
          ),
        ),
        GoRoute(
          path: '/emergency',
          name: RouteNames.emergency,
          pageBuilder: (context, state) => MaterialPage<Emergency>(
            child: BlocProvider(
              create: (context) => EmergencyContactBloc(),
              child: const Emergency(),
            ),
          ),
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
