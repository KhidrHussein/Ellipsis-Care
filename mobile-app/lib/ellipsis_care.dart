import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import 'config/env.dart';
import 'config/router/router.dart';
import 'config/theme/theme.dart';
import 'src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'src/features/emergency/presentation/bloc/emergency_bloc.dart';
import 'src/features/home/presentation/bloc/home_bloc.dart';
import 'src/features/onboarding/cubit/onboarding_cubit.dart';
import 'src/features/reminders/presentation/bloc/reminder_bloc.dart';
import 'src/features/settings/presentation/bloc/settings_bloc.dart';
import 'src/shared/user_bloc/user_bloc.dart';
import 'src/shared/widgets/navigator_shell/navigator_shell.dart';

class EllipsisCare extends StatelessWidget {
  const EllipsisCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingsBloc()..add(LoadSettingsEvent()),
        ),
        BlocProvider(
          create: (context) => UserBloc()..add(GetUserEvent()),
        ),
        BlocProvider(
          create: (context) => DashboardBloc()..add(GetMedications()),
        ),
        BlocProvider(
          create: (context) => ReminderBloc()
            ..add(InitializeVoiceCommandEvent())
            ..add(GetAllReminders()),
        ),
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => NavigationRowCubit(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) =>
              EmergencyContactBloc()..add(FetchContactsEvent()),
        ),
      ],
      child: ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(393, 852),
        builder: (context, child) {
          return BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return ToastificationWrapper(
                child: MaterialApp.router(
                  title: "Ellipsis Care",
                  routerConfig: router,
                  builder: Env.isDev
                      ? (context, child) => Stack(
                            children: [child!, _flavorBanner()],
                          )
                      : null,
                  themeMode:
                      state.enabledDarkMode ? ThemeMode.dark : ThemeMode.light,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  debugShowCheckedModeBanner: false,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _flavorBanner() {
    return Positioned(
      top: 0,
      right: 0,
      child: Banner(
        message: "${Env.flavor}",
        location: BannerLocation.topEnd,
        color: Env.color,
      ),
    );
  }
}
