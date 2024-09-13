import 'package:flutter/material.dart';

class Reminders extends StatelessWidget {
  const Reminders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CalendarDatePicker(
            initialDate: DateTime(2000),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030),
            currentDate: DateTime.now(),
            onDateChanged: (date) {},
          )
       
        ],
      ),
    );
  }
}
