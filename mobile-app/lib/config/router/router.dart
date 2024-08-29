import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/forgot_password.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/signin.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/signup.dart';
import 'package:ellipsis_care/src/features/authentication/presentation/view/verify_email.dart';
import 'package:ellipsis_care/src/features/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _routerKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  navigatorKey: _routerKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.onboarding,
      pageBuilder: (context, state) =>
          const MaterialPage<Onboarding>(child: Onboarding()),
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
  ],
);
