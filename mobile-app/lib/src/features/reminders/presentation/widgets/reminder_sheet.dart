import 'package:ellipsis_care/core/utils/enums/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/src/features/reminders/presentation/views/add_reminder.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import '../../models/reminder.dart';
import '../bloc/reminder_bloc.dart';
import 'reminder_tile.dart';

class ReminderSheet extends StatelessWidget {
  const ReminderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReminderBloc>();
    final blocState = context.watch<ReminderBloc>();

    return DraggableScrollableSheet(
      minChildSize: .35,
      initialChildSize: .4,
      builder: (context, scrollController) {
        return Container(
          padding: REdgeInsets.only(left: 27.w, right: 27.w, top: 6.h),
          decoration: BoxDecoration(
            color: context.themeExtension.reminderColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            border: Border.symmetric(
              // FIXME: Use the correct color
              horizontal: BorderSide(color: context.themeExtension.homeColor),
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
                      UtilHelpers.dateFormatter2(blocState.state.currentDate),
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
                bloc: bloc,
                builder: (context, state) {
                  final reminders =
                      state.calendarEvent[blocState.state.currentDate];

                  if (state.apiState == ApiState.loading &&
                      state.error.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return state.calendarEvent[blocState.state.currentDate] !=
                            null
                        ? SliverList.builder(
                            itemCount: state
                                .calendarEvent[blocState.state.currentDate]
                                ?.length,
                            itemBuilder: (context, index) {
                              return ReminderTile(reminder: reminders![index]);
                            },
                          )
                        : const SliverToBoxAdapter(child: SizedBox());
                  }
                },
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () async {
                    final reminder = await showAdaptiveDialog<ReminderModel>(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => const AddReminder(),
                    );
                    if (reminder != null) {
                      bloc.add(
                        CreateReminderEvent(
                          name: reminder.name,
                          dosage: reminder.dosage,
                          type: reminder.type,
                          interval: reminder.interval,
                          schedule: reminder.schedule,
                          instruction: reminder.instruction,
                          startDate: reminder.startDate,
                          endDate: reminder.endDate,
                          eventStartTime: reminder.reminderStartTime,
                          eventEndTime: reminder.reminderEndTime,
                        ),
                      );
                    }
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: REdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: context.themeExtension.reminderInverseColor,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 16,
                            offset: Offset(0, 2),
                            color: AppColors.addButtonShadowColor,
                          )
                        ],
                      ),
                      child: Icon(Icons.add,
                          color: context.themeExtension.reminderColor),
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
