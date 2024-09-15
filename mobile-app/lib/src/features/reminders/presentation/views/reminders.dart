import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Reminders extends StatelessWidget {
  const Reminders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Coming soon",
            style: context.textTheme.headlineSmall,
          )
          // CalendarDatePicker(
          //   initialDate: DateTime(2000),
          //   firstDate: DateTime(2000),
          //   lastDate: DateTime(2030),
          //   currentDate: DateTime.now(),
          //   onDateChanged: (date) {},
          // ),
          // TableCalendar(
          //   focusedDay: DateTime.now(),
          //   firstDay: DateTime(1990),
          //   lastDay: DateTime(2030),
          //   calendarStyle: CalendarStyle(

          //   ),
          // )
        ],
      ),
    );
  }
}
