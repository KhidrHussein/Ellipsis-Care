import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import 'config/app_config.dart';
import 'config/router/router.dart';
import 'config/theme/theme.dart';
import 'src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'src/features/dashboard/presentation/controller/cubit/medications_cubit.dart';
import 'src/features/emergency/presentation/bloc/emergency_bloc.dart';
import 'src/features/home/presentation/bloc/home_bloc.dart';
import 'src/features/onboarding/cubit/onboarding_cubit.dart';
import 'src/features/reminders/presentation/bloc/reminder_bloc.dart';
import 'src/features/settings/presentation/bloc/settings_bloc.dart';
import 'src/shared/user_bloc/user_bloc.dart';
import 'src/shared/widgets/navigator_shell/navigator_shell.dart';

class EllipsisCare extends StatelessWidget {
  final AppConfig config;
  const EllipsisCare({super.key, required this.config});

  Widget _flavorBanner() {
    return Positioned(
      top: 0,
      right: 0,
      child: Banner(
        message: config.flavor,
        location: BannerLocation.topEnd,
        color: config.color!,
      ),
    );
  }

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
          create: (context) => ReminderBloc()
            ..add(InitializeVoiceCommandEvent())
            ..add(GetAllReminders()),
        ),
        BlocProvider(
          create: (context) =>
              EmergencyContactBloc()..add(FetchContactsEvent()),
        ),
        BlocProvider(
          create: (context) => MedicationProgressCubit(),
        )
      ],
      child: ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(393, 852),
        builder: (context, child) {
          return BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return OKToast(
                child: MaterialApp.router(
                  title: "Ellipsis Care",
                  routerConfig: router,
                  builder: config.flavor != "prod"
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
}
