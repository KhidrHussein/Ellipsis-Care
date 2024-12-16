import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/enums/reminder_options/reminder_options.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/controller/bloc/dashboard_bloc.dart';

import '../../../../../../core/utils/extensions.dart';
//import '../../../../../../core/constants/colors.dart';

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
          SvgPicture.asset(
            switch (schedule) {
              ReminderSchedule.morning => AssetStrings.morningIcon,
              ReminderSchedule.afternoon => AssetStrings.afternoonIcon,
              ReminderSchedule.evening => AssetStrings.nightIcon,
            },
          ),
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
                        EditRoutineProgress(schedule, value ?? false),
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
