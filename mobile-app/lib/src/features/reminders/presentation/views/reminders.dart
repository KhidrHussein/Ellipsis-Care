import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Reminders extends StatelessWidget {
  const Reminders({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          // CleanCalendar(
          //   headerProperties: HeaderProperties(
          //     monthYearDecoration: MonthYearDecoration(),
          //     navigatorDecoration: NavigatorDecoration(
          //       navigateLeftButtonIcon: Icon(null)
          //     )
          //   ),
          // )
        ],
      ),
    );
  }
}
