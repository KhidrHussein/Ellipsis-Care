import 'package:ellipsis_care/config/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import 'config/router/router.dart';
import 'config/theme/controller.dart';
import 'core/services/notification_service.dart';
import 'core/services/storage_service.dart';
import 'core/utils/locator.dart';

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
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(393, 852),
        builder: (context, child) => BlocBuilder<ThemeCubit, ThemeMode>(
          bloc: context.read<ThemeCubit>(),
          builder: (context, state) {
            return OKToast(
              child: MaterialApp.router(
                title: "Ellipsis Care",
                routerConfig: router,
                themeMode: state,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                debugShowCheckedModeBanner: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
