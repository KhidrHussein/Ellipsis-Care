import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/utils/extensions.dart';
import '../../../../../core/constants/colors.dart';
import '../bloc/reminder_bloc.dart';

class ReminderCalendar extends StatelessWidget {
  const ReminderCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReminderBloc>();

    return Container(
      decoration: BoxDecoration(
        color: context.themeExtension.reminderColor,
        border: BorderDirectional(
          //FIXME: Use the correct color
          top: BorderSide(color: context.themeExtension.homeColor),
        ),
      ),
      child: BlocBuilder<ReminderBloc, ReminderState>(
        builder: (context, state) {
          return TableCalendar(
            currentDay: bloc.state.currentDate,
            focusedDay: bloc.state.currentDate,
            firstDay: DateTime.now(),
            lastDay: DateTime(2040),
            daysOfWeekHeight: 42.h,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              headerPadding: REdgeInsets.only(top: 24, left: 22, right: 22),
              titleTextStyle: context.textTheme.titleMedium!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
              leftChevronIcon:
                  _chevronIconBuilder(context, Icons.keyboard_arrow_left),
              rightChevronIcon:
                  _chevronIconBuilder(context, Icons.keyboard_arrow_right),
              leftChevronMargin: REdgeInsets.symmetric(),
              rightChevronMargin: REdgeInsets.symmetric(),
              rightChevronPadding: EdgeInsets.zero,
              leftChevronPadding: REdgeInsets.only(right: 16),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: context.textTheme.titleMedium!,
              weekendStyle: context.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w300),
            ),
            calendarStyle: CalendarStyle(
              cellAlignment: Alignment.center,
              cellMargin: EdgeInsets.zero,
              markerDecoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: context.themeExtension.reminderColor,
              ),
              tablePadding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
              markerSizeScale: .15,
              markersAnchor: 1.4,
              markersMaxCount: 1,
              todayDecoration: BoxDecoration(
                color: context.themeExtension.reminderInverseColor,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: context.themeExtension.reminderColor,
                shape: BoxShape.circle,
              ),
            ),
            eventLoader: (date) {
              return bloc.state.reminders.where((event) {
                final startDate = DateTime.parse(event.startDate);
                return isSameDay(bloc.state.currentDate, startDate);
              }).toList();
            },
            onDaySelected: (selectedDay, focusedDay) {
              bloc.add(
                UpdateCurrentDateEvent(newDate: selectedDay),
              );
            },
          );
        },
      ),
    );
  }

  Widget _chevronIconBuilder(BuildContext context, IconData icon) {
    return Container(
      height: 32.h,
      width: 32.w,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        color: AppColors.calendarArrowBgColor,
      ),
      child: Icon(
        icon,
        size: 34,
        color: context.themeExtension.reminderInverseColor,
      ),
    );
  }
}
