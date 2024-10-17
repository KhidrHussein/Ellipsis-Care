import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/constants/colors.dart';
import '../bloc/bloc.dart';

class ReminderCalendar extends StatelessWidget {
  const ReminderCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderBloc = context.read<ReminderBloc>();
    final reminderBlocState = context.watch<ReminderBloc>();

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: BorderDirectional(
          top: BorderSide(color: AppColors.reminderSheetBorderColor),
        ),
      ),
      child: BlocBuilder<ReminderBloc, ReminderState>(
        bloc: reminderBlocState,
        builder: (context, state) {
          return TableCalendar(
            currentDay: reminderBlocState.state.selectedDate,
            focusedDay: reminderBlocState.state.selectedDate,
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            daysOfWeekHeight: 42.h,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              headerPadding: REdgeInsets.only(top: 24, left: 22, right: 22),
              titleTextStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
              leftChevronIcon: Container(
                height: 32.h,
                width: 32.w,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  color: AppColors.calendarArrowBgColor,
                ),
                child: const Icon(Icons.keyboard_arrow_left, size: 34),
              ),
              rightChevronIcon: Container(
                height: 32.h,
                width: 32.w,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  color: AppColors.calendarArrowBgColor,
                ),
                child: const Icon(Icons.keyboard_arrow_right, size: 34),
              ),
              leftChevronMargin: REdgeInsets.symmetric(),
              rightChevronMargin: REdgeInsets.symmetric(),
              rightChevronPadding: EdgeInsets.zero,
              leftChevronPadding: REdgeInsets.only(right: 16),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColors.black.withOpacity(.87),
              ),
              weekendStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black.withOpacity(.87),
              ),
            ),
            calendarStyle: CalendarStyle(
              cellAlignment: Alignment.center,
              cellMargin: EdgeInsets.zero,
              markerDecoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: AppColors.white,
              ),
              tablePadding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
              markerSizeScale: .15,
              markersMaxCount: 1,
              // selectedDecoration: const BoxDecoration(
              //     color: AppColors.black, shape: BoxShape.circle),
            ),
            // eventLoader: (date) {
            //   if (reminderBloc.state.selectedDate != date) {
            //     date.printLog();
            //     return reminderBlocState.state.reminders;
            //   } else {
            //     return [];
            //   }
            // },
            // onHeaderTapped: (focusedDay) {
            //   focusedDay.printLog();
            // },

            selectedDayPredicate: (day) {
              return day == reminderBlocState.state.selectedDate;
            },
            onDaySelected: (selectedDay, focusedDay) {
              reminderBloc.add(
                SelectDate(newDate: selectedDay),
              );
            },
            onPageChanged: (focusedDay) {},
          );
        },
      ),
    );
  }
}
