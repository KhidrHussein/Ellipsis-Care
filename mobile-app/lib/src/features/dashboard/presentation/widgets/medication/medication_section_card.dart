import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/controller/cubit/medications_cubit.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/medication/routine.dart';

import '../../../../../../core/constants/colors.dart';

class MedicationSectionCard extends StatefulWidget {
  final String name;
  final String dosage;

  const MedicationSectionCard({
    super.key,
    required this.name,
    required this.dosage,
  });

  @override
  State<MedicationSectionCard> createState() => _MedicationSectionCardState();
}

class _MedicationSectionCardState extends State<MedicationSectionCard> {
  final ValueNotifier<bool> _showRoutines = ValueNotifier(false);
  final Tween<double> _indicatorValue = Tween<double>(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    final medicationsProgressCubit = context.watch<MedicationProgressCubit>();

    return GestureDetector(
      onTap: () => _showRoutines.value = !_showRoutines.value,
      child: Container(
        padding: REdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1.5.w,
            color: AppColors.medicationCardBorderColor,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: _showRoutines,
          builder: (context, value, child) {
            return Column(
              children: [
                child!,
                if (_showRoutines.value) ...<Widget>[
                  12.verticalSpace,
                  Row(
                    children: [
                      .21.sw.horizontalSpace,
                      const Expanded(
                        child: Column(
                          children: [
                            Routine(
                              icon: AssetStrings.morningIcon,
                              name: "Morning",
                              timeAlloted: "5",
                            ),
                            Routine(
                              icon: AssetStrings.afternoonIcon,
                              name: "Afternoon",
                              timeAlloted: "5",
                            ),
                            Routine(
                              icon: AssetStrings.nightIcon,
                              name: "Night",
                              timeAlloted: "5",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ]
              ],
            );
          },
          child: Row(
            children: [
              Container(
                width: 82.w,
                height: 85.h,
                padding: REdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.medicationIconBgColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: SvgPicture.asset(AssetStrings.medicationIcon),
              ),
              12.horizontalSpace,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.name,
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        ValueListenableBuilder(
                          valueListenable: _showRoutines,
                          builder: (context, value, child) {
                            return Icon(
                              !value
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                            );
                          },
                        ),
                      ],
                    ),
                    Text(
                      widget.dosage,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.medicationCardSubTextColor,
                      ),
                    ),
                    8.verticalSpace,
                    TweenAnimationBuilder(
                      tween: _indicatorValue,
                      duration: Durations.short4,
                      builder: (context, value, _) {
                        return LinearProgressIndicator(
                          value:
                              (medicationsProgressCubit.progress() / 3) * value,
                          minHeight: 7.h,
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.medicationProgressIndicatorColor,
                          backgroundColor: AppColors.medicationProgressBgColor,
                        );
                      },
                    ),
                    4.verticalSpace,
                    Text(
                      "status",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.medicationCardSubTextColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
