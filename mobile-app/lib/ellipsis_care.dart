import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/config/router/router.dart';
import 'package:ellipsis_care/config/theme/controller.dart';

class EllipsisCare extends StatelessWidget {
  const EllipsisCare({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(393, 852),
      builder: (context, child) => BlocBuilder<ThemeCubit, ThemeData>(
        bloc: ThemeCubit(),
        builder: (context, state) {
          return MaterialApp.router(
            title: "Ellipsis Care",
            routerConfig: router,
            theme: state,
          );
        },
      ),
    );
  }
}
