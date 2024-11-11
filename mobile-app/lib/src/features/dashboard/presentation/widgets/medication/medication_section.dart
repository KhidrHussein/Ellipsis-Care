import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/medication/medication_section_card.dart';
import 'package:flutter/material.dart';

class MedicationSection extends StatelessWidget {
  const MedicationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MedicationSectionCard(
      name: "Paracetamol",
      dosage: "500mg, daily",
    );
  }
}
