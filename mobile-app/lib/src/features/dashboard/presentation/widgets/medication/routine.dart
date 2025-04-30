import '../../../../../../config/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../../bloc/dashboard_bloc.dart';

class RoutineCard extends StatelessWidget {
  final ReminderSchedule schedule;
  final String timeAlloted;

  const RoutineCard({
    super.key,
    required this.schedule,
    required this.timeAlloted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          switch (schedule) {
            ReminderSchedule.morning =>
              AppAssets.icons.dashboard.icMorning.svg(),
            ReminderSchedule.afternoon =>
              AppAssets.icons.dashboard.icAfternoon.svg(),
            ReminderSchedule.evening => AppAssets.icons.dashboard.icNight.svg(),
          },

          10.horizontalSpace,
          Text(
            switch (schedule) {
              ReminderSchedule.morning => "Morning",
              ReminderSchedule.afternoon => "Afternoon",
              ReminderSchedule.evening => "Night",
            },
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 15.sp,
            ),
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       switch (schedule) {
          //         ReminderSchedule.morning => "Morning",
          //         ReminderSchedule.afternoon => "Afternoon",
          //         ReminderSchedule.evening => "Night",
          //       },
          //       style: context.textTheme.titleMedium?.copyWith(
          //         fontSize: 15.sp,
          //       ),
          //     ),
          //     Text(
          //       timeAlloted,
          //       style: context.textTheme.labelSmall?.copyWith(
          //         fontSize: 10.sp,
          //         color: AppColors.medicationCardSubTextColor,
          //       ),
          //     )
          //   ],
          // ),
          const Spacer(),
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Checkbox(
                value: state.routines[schedule] ?? false,
                onChanged: (value) {
                  context.read<DashboardBloc>().add(
                        EditRoutineProgress(
                            schedule: schedule, hasPassed: value ?? false),
                      );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
