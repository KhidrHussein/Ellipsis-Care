import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/constants/asset_strings.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../reminders/models/reminder_model.dart/reminder_model.dart';
import 'routine.dart';

import '../../../../../../core/constants/colors.dart';

class MedicationCard extends StatefulWidget {
  final ReminderModel medication;

  const MedicationCard({super.key, required this.medication});

  @override
  State<MedicationCard> createState() => _MedicationSectionCardState();
}

class _MedicationSectionCardState extends State<MedicationCard> {
  late final ValueNotifier<bool> _showRoutines;
  final Tween<double> _indicatorValue = Tween<double>(begin: 0.0, end: 1.0);

  @override
  void initState() {
    super.initState();
    _showRoutines = ValueNotifier(widget.medication.schedule.isNotEmpty);
  }

  String _getStatus(int length) {
    return length == widget.medication.schedule.length
        ? "Completed"
        : "Not Completed";
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DashboardBloc>();
    
    return GestureDetector(
      onTap: () => _showRoutines.value = !_showRoutines.value,
      child: Container(
        padding: REdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            width: 1.5.w,
            color: context.themeExtension.medicationCardBorderColor,
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
                      Expanded(
                        child: Column(
                          children: [
                            ...widget.medication.schedule.map(
                              (schedule) => RoutineCard(
                                schedule: schedule,
                                timeAlloted: UtilHelpers.getTimeFromIsoString(
                                  widget.medication.startDate,
                                ),
                              ),
                            ),
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
                  color: context.themeExtension.medicationIconBgColor,
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
                          widget.medication.name,
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
                      widget.medication.dosage,
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
                        return BlocBuilder<DashboardBloc, DashboardState>(
                          builder: (context, state) {
                            return LinearProgressIndicator(
                              value: (state.medicationProgress /
                                      widget.medication.schedule.length) *
                                  value,
                              minHeight: 7.h,
                              borderRadius: BorderRadius.circular(8.r),
                              color: context.themeExtension
                                  .medicationProgressIndicatorColor,
                              backgroundColor: context
                                  .themeExtension.medicationProgressBgColor,
                            );
                          },
                        );
                      },
                    ),
                    4.verticalSpace,
                    Text(
                      _getStatus(bloc.state.medicationProgress),
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
