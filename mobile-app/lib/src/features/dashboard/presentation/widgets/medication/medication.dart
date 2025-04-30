import '../../../../../../config/gen/assets.gen.dart';
import 'package:ellipsis_care/core/utils/utils.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
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
          icon: AppAssets.icons.icDrug.path,
          title: "Medications",
          type: ReminderType.drug,
          progress: 1,
        ),
        20.verticalSpace,
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
              itemCount: data.length + 1,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (data.isEmpty) {
                  return OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.add, size: 26),
                        Text(
                          "Add new",
                          style: context.textTheme.labelLarge,
                        ),
                      ],
                    ),
                  );
                }
                return MedicationCard(medication: data[index]);
              },
              separatorBuilder: (context, index) =>  10.verticalSpace,
            );
          },
        ),
      ],
    );
  }
}
