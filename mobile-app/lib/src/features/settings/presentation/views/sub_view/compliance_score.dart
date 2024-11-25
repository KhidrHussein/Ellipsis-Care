import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/utils/enums/reminder.dart';
import 'package:ellipsis_care/core/utils/enums/sync_score.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_appbar.dart';
import 'package:ellipsis_care/src/shared/progress_bar.dart';
import 'package:ellipsis_care/src/shared/user_avatar.dart';

import '../../../../../../core/constants/colors.dart';

class ComplianceScore extends StatefulWidget {
  const ComplianceScore({super.key});

  @override
  State<ComplianceScore> createState() => _ComplianceScoreState();
}

class _ComplianceScoreState extends State<ComplianceScore> {
  final Tween<double> _indicatorValue = Tween<double>(begin: 0.0, end: 1.0);
  final SyncScore _currentScore = SyncScore.weak;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.primaryColorDark,
      body: SafeArea(
        child: Container(
          padding: REdgeInsets.all(10),
          margin: REdgeInsets.symmetric(horizontal: 16, vertical: 30),
          decoration: BoxDecoration(
            color: context.themeExtension.settingsCardColor,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SettingsAppbar(),
              20.verticalSpace,
              const UserAvatar(radius: 35),
              13.verticalSpace,
              Text(
                "Optimal Sync",
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: _currentScore.scoreColor,
                ),
              ),
              3.verticalSpace,
              Text(
                "90%",
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              3.verticalSpace,
              Text(
                "Health Sync Score",
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: context.textTheme.bodyLarge?.color?.withOpacity(.5),
                ),
              ),
              20.verticalSpace,
              _buildSyncScoreBar(_currentScore),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: Column(
                  children: [
                    ProgressBar(
                      progress: 45,
                      title: "Medications",
                      type: ReminderType.drug,
                      icon: AssetStrings.drugIcon,
                    ),
                    20.verticalSpace,
                    ProgressBar(
                      progress: 65,
                      title: "Meal & Nutrition",
                      type: ReminderType.food,
                      icon: AssetStrings.foodIcon,
                    ),
                  ],
                ),
              ),
              ...SyncScore.values.map(
                (syncScore) => Container(
                  width: 1.sw,
                  height: 20.h,
                  alignment: Alignment.center,
                  margin: REdgeInsets.only(bottom: 5.h),
                  color: syncScore.scoreColor,
                  child: Text(
                    syncScore.text,
                    style: context.textTheme.labelMedium
                        ?.copyWith(fontSize: 13.sp),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSyncScoreBar(SyncScore sync) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Health Sync Score",
              style: context.textTheme.labelLarge?.copyWith(fontSize: 15.sp),
            ),
            const Spacer(),
            Text(
              "90% done",
              style: context.textTheme.labelSmall?.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        4.verticalSpace,
        TweenAnimationBuilder(
          tween: _indicatorValue,
          duration: Durations.extralong4,
          builder: (context, value, _) {
            return LinearProgressIndicator(
              value: 40 * value * 0.01,
              minHeight: 12.h,
              borderRadius: BorderRadius.circular(8.r),
              color: sync.scoreColor,
              backgroundColor: sync.bgColor,
            );
          },
        )
      ],
    );
  }
}
