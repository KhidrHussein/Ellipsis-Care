import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/enums/reminder_options/reminder_options.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ellipsis_care/src/shared/widgets/progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import 'medication_card.dart';
import 'package:flutter/material.dart';

class Medication extends StatelessWidget {
  const Medication({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressBar(
          icon: AssetStrings.drugIcon,
          title: "Medications",
          type: ReminderType.drug,
          progress: 1,
        ),
        10.verticalSpace,
        BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            final data = state.medications.where((medication) {
              final createdAt = DateTime.parse(medication.startDate);
              return isSameDay(DateTime.now(), createdAt);
            }).toList();

            data.sort((a, b) {
              final aDate = DateTime.parse(a.startDate);
              final bDate = DateTime.parse(b.startDate);
              return aDate.compareTo(bDate);
            });

            return ListView.separated(
              shrinkWrap: true,
              itemCount: data.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  MedicationCard(medication: data[index]),
              separatorBuilder: (context, index) => 10.verticalSpace,
            );
          },
        ),
      ],
    );
  }
}
