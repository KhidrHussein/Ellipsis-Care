import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/constants/colors.dart';

class ReminderCalendar extends StatelessWidget {
  const ReminderCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.reminderCalendarBackgroundColor,
        border: BorderDirectional(
          top: BorderSide(color: AppColors.reminderSheetBorderColor),
        ),
      ),
      child: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(1990),
        lastDay: DateTime(2030),
        // eventLoader: (date) => [44, 22, 3],
        // calendarBuilders: CalendarBuilders(
        //   headerTitleBuilder: (context, date) {
        //     return Row();
        //   },
        // ),
        daysOfWeekHeight: 42.h,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          headerPadding: REdgeInsets.only(top: 24, left: 22, right: 22),
          titleTextStyle:
              TextStyle(fontSize: 33.sp, fontWeight: FontWeight.w400),
          leftChevronVisible: false,
          rightChevronIcon: const Icon(Icons.keyboard_arrow_down),
          rightChevronMargin: REdgeInsets.symmetric(horizontal: 0),
          rightChevronPadding: REdgeInsets.all(6),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontSize: 16.sp,
            color: AppColors.black.withOpacity(.4),
          ),
          weekendStyle: TextStyle(
            fontSize: 16.sp,
            color: AppColors.black.withOpacity(.4),
          ),
        ),
        calendarStyle: CalendarStyle(
          cellAlignment: Alignment.center,
          cellMargin: EdgeInsets.zero,
          tablePadding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
          markerSizeScale: .15,
          markersMaxCount: 1,
          todayDecoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
      ),
    );
  }
}
