import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:flutter/painting.dart';

enum Status {
  positive("Positive", Color(0xFF56C568)),
  informational("Informational", Color(0xFF3FA2F7)),
  negative("Negative", Color(0xFFEB5757)),
  warning("Warning", Color(0xFFFFC400)),
  inactive("Inactive", Color(0xFFD4D4D4), AppColors.darkGrey);

  const Status(this.statusName, this.statusColor,
      [this.labelColor = AppColors.white]);

  final String statusName;
  final Color labelColor;
  final Color statusColor;
}
