import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/home/presentation/controller/cubit/dashboard_cubit.dart';
import 'package:ellipsis_care/src/shared/appbar.dart';

import '../../../../../core/utils/helpers.dart';
import '../controller/bloc/home_bloc.dart';

class RecordingPage extends StatelessWidget {
  const RecordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    final dashboardCubit = context.read<DashboardCubit>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileBar(),
            const Spacer(),

            //TODO: Add animation spinner

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<DashboardCubit, bool>(
                  bloc: dashboardCubit,
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (state) {
                          dashboardCubit.pauseRecording();
                        } else {
                          dashboardCubit.resumeRecording();
                        }
                      },
                      child: Container(
                        padding: REdgeInsets.all(20),
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: AppColors.pauseIconBgColor,
                        ),
                        child: state
                            ? SvgPicture.asset(AssetStrings.pauseIcon)
                            : const Icon(
                                Icons.play_arrow,
                                color: AppColors.white,
                              ),
                      ),
                    );
                  },
                ),
                10.sizedBoxWidth,
                BlocListener<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  listener: (context, state) {
                    switch (state) {
                      case EndRecordingState():
                        UtilHelpers.popRoute();
                        UtilHelpers.pushRoute(RouteNames.promptResponses);

                        break;
                      default:
                    }
                  },
                  child: GestureDetector(
                    onTap: () => homeBloc.add(EndRecordingEvent()),
                    child: Container(
                      padding: REdgeInsets.all(20),
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: AppColors.stopIconBgColor,
                      ),
                      child:
                          SvgPicture.asset(AssetStrings.cancelIcon, width: 21),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
