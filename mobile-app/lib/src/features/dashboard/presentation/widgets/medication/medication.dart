import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/enums/reminder_options/reminder_options.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/views/dashboard.dart';
import 'package:ellipsis_care/src/shared/widgets/progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => MedicationCard(
            name: "Paracetamol",
            dosage: "500mg, daily",
          ),
          separatorBuilder: (context, index) => 10.verticalSpace,
        ),
      ],
    );
  }
}
