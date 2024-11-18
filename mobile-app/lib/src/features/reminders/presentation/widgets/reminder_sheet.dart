import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/src/features/reminders/models/reminder.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/controller/cubit/calender_cubit.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/views/add_reminder.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';
import '../controller/bloc/reminder_bloc.dart';
import 'reminder_tile.dart';

class ReminderSheet extends StatelessWidget {
  const ReminderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderBloc = context.read<ReminderBloc>();
    final calendarCubitState = context.watch<CalendarCubit>();
    final reminderBlocState = context.watch<ReminderBloc>();

    return DraggableScrollableSheet(
      minChildSize: .35,
      initialChildSize: .4,
      builder: (context, scrollController) {
        return Container(
          padding: REdgeInsets.only(left: 27.w, right: 27.w, top: 6.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            border: const Border.symmetric(
              horizontal: BorderSide(color: AppColors.outlineBorderColor),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(height: 3.h, width: 64.w, color: AppColors.black),
                    12.sizedBoxHeight,
                    Text(
                      UtilHelpers.dateFormatter2(calendarCubitState.state),
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ).alignLeft,
                    10.sizedBoxHeight,
                  ],
                ),
              ),
              BlocBuilder<ReminderBloc, ReminderState>(
                bloc: reminderBlocState,
                builder: (context, state) {
                  final reminders = state.events[calendarCubitState.state];
                  return reminders != null
                      ? SliverList.builder(
                          itemCount:
                              state.events[calendarCubitState.state]?.length,
                          itemBuilder: (context, index) {
                            return ReminderTile(reminder: reminders[index]);
                          },
                        )
                      : const SliverToBoxAdapter(child: SizedBox());
                },
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () async {
                    final result = await showAdaptiveDialog<ReminderModel>(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => const AddReminder(),
                    );
                    if (result != null) {
                      reminderBloc.add(
                        CreateReminderEvent(
                          name: result.name,
                          dosage: result.dosage,
                          type: result.type,
                          interval: result.interval,
                          schedule: result.schedule,
                          instruction: result.instruction,
                          startDate: result.startDate,
                          endDate: result.endDate,
                          eventDate: calendarCubitState.state,
                          eventStartTime: result.reminderStartTime,
                          eventEndTime: result.reminderEndTime,
                        ),
                      );
                    }
                  },
                  child: SizedBox(
                    width: 48,
                    child: Container(
                      padding: REdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 16,
                            offset: Offset(0, 2),
                            color: AppColors.addButtonShadowColor,
                          )
                        ],
                      ),
                      child: const Icon(Icons.add, color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
