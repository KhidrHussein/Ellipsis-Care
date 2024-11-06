import 'package:ellipsis_care/core/services/notification_service.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:ellipsis_care/src/features/reminders/models/reminder.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/views/add_reminder.dart';
import 'package:ellipsis_care/src/features/reminders/presentation/widgets/reminder_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';
import '../bloc/reminder_bloc.dart';

class ReminderSheet extends StatelessWidget {
  const ReminderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderBloc = context.read<ReminderBloc>();
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
                      UtilHelpers.dateFormatter2(
                          reminderBlocState.state.selectedDate),
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ).alignLeft,
                    10.sizedBoxHeight,
                    // TextButton(
                    //   onPressed: () async {
                    //     await injector<NotificationService>()
                    //         .createReminderNotification();
                    //     // final result = await showAdaptiveDialog<ReminderModel>(
                    //     //   context: context,
                    //     //   barrierDismissible: true,
                    //     //   builder: (context) => const AddReminder(),
                    //     // );
                    //     // if (result != null) {
                    //     //   reminderBloc.add(
                    //     //     CreateReminder(
                    //     //       name: result.name,
                    //     //       dosage: result.dosage,
                    //     //       type: result.type,
                    //     //       interval: result.interval,
                    //     //       schedule: result.schedule,
                    //     //       instruction: result.instruction,
                    //     //       startDate: result.startDate,
                    //     //       endDate: result.endDate,
                    //     //     ),
                    //     //   );
                    //     // }
                    //   },
                    //   child: Text("Add Reminder"),
                    // ),
                  ],
                ),
              ),
              BlocBuilder<ReminderBloc, ReminderState>(
                bloc: reminderBlocState,
                builder: (context, state) {
                  return switch (state) {
                    CreatedReminder(reminders: var reminders) =>
                      SliverList.builder(
                        itemCount: reminders.length,
                        itemBuilder: (context, index) {
                          return ReminderTile(reminder: reminders[index]);
                        },
                      ),
                    _ => const SliverToBoxAdapter(child: SizedBox()),
                  };
                },
              )
            ],
          ),
        );
      },
    );
  }
}
