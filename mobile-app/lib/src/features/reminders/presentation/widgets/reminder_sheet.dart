import 'package:ellipsis_care/core/enums/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/utils/helpers.dart';
import '../bloc/reminder_bloc.dart';
import 'reminder_tile.dart';

class ReminderSheet extends StatelessWidget {
  const ReminderSheet({super.key});

  @override
  Widget build(BuildContext context) {
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
                builder: (context, state) {
                  final eventList = state.reminders.where((event) {
                    final createdAt = DateTime.parse(event.startDate);
                    return isSameDay(state.currentDate, createdAt);
                  }).toList();

                  eventList.sort((a, b) {
                    final aDate = DateTime.parse(a.startDate);
                    final bDate = DateTime.parse(b.startDate);
                    return aDate.compareTo(bDate);
                  });

                  if (state.apiState == ApiState.loading &&
                      state.error.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SliverList.builder(
                      itemCount: eventList.length,
                      itemBuilder: (context, index) => ReminderTile(
                        reminder: eventList[index],
                      ),
                    );
                  }
                },
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () => UtilHelpers.showReminderDialog(context: context),
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
