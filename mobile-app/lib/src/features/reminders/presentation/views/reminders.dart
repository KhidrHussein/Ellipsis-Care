import 'package:flutter/material.dart';

import '../widgets/reminder_bar.dart';
import '../widgets/reminder_calendar.dart';
import '../widgets/reminder_sheet.dart';

class Reminders extends StatelessWidget {
  const Reminders({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          ReminderBar(),
          Expanded(
            child: Stack(
              children: [
                ReminderCalendar(),
                ReminderSheet(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
