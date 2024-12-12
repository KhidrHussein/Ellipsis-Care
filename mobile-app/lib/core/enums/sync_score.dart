import 'package:flutter/painting.dart';

import '../constants/colors.dart';

enum SyncScore {
  optimal(
    text: "90% - 100% - Optimal Sync",
    bgColor: AppColors.optimalScoreBgColor,
    scoreColor: AppColors.optimalScoreColor,
  ),
  strong(
    text: "80% - 89% - Strong Sync",
    bgColor: AppColors.strongScoreBgColor,
    scoreColor: AppColors.strongScoreColor,
  ),
  moderate(
    text: "70% - 79% - Moderate Sync",
    bgColor: AppColors.moderateScoreBgColor,
    scoreColor: AppColors.moderateScoreColor,
  ),
  weak(
    text: "50% - 69% - Weak Sync",
    bgColor: AppColors.weakScoreBgColor,
    scoreColor: AppColors.weakScoreColor,
  ),
  outOfSync(
    text: "Below 50% - Out of Sync",
    bgColor: AppColors.outScoreBgColor,
    scoreColor: AppColors.outScoreColor,
  );

  const SyncScore({
    required this.text,
    required this.scoreColor,
    required this.bgColor,
  });

  final String text;
  final Color scoreColor;
  final Color bgColor;
}
