import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import 'package:ellipsis_care/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/bloc/emergency_bloc.dart';
import 'package:ellipsis_care/src/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/bloc/reminder_bloc.dart';
import 'package:ellipsis_care/src/shared/widgets/navigator_shell/navigator_shell.dart';

import 'src/shared/controller/app_session_bloc.dart';
import 'config/router/router.dart';
import 'config/theme/theme.dart';
import 'core/services/notification_service.dart';
import 'core/services/storage_service.dart';
import 'core/utils/locator.dart';
import 'src/features/dashboard/presentation/controller/cubit/medications_cubit.dart';
import 'src/features/home/presentation/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: "secrets.env");

  // Initialize services
  initService();

  // Initialize [Hive]
  await injector<StorageService>().initializeStorage();

  // Register [Storage Service] type adapters
  injector<StorageService>().registerModels();

  await injector<NotificationService>().init();

  await Firebase.initializeApp();

  runApp(const EllipsisCare());
}

class EllipsisCare extends StatelessWidget {
  const EllipsisCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppSessionBloc()..add(InitializeAppSessionEvent()),
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
              ReminderBloc()..add(InitializeVoiceCommandEvent()),
        ),
        BlocProvider(
          create: (context) => EmergencyContactBloc(),
        ),
        BlocProvider(
          create: (context) => MedicationProgressCubit(),
        )
      ],
      child: ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(393, 852),
        builder: (context, child) {
          context.read<AppSessionBloc>().add(LoadAppSessionEvent());

          return BlocBuilder<AppSessionBloc, AppSessionState>(
            builder: (context, state) {
              return OKToast(
                child: MaterialApp.router(
                  title: "Ellipsis Care",
                  routerConfig: router,
                  themeMode: state.appSession?.hasEnabledDarkMode == true
                      ? ThemeMode.dark
                      : ThemeMode.light,
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
