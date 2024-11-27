import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/src/features/reminders/presentation/bloc/reminder_bloc.dart';

class ReminderBar extends StatelessWidget {
  const ReminderBar({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderBloc = context.read<ReminderBloc>();
    
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          IconButton(
            onPressed: () {
              reminderBloc.add(
                ActivateVoiceCommandEvent(),
              );
            },
            icon: const Icon(CupertinoIcons.calendar_badge_plus),
          )
        ],
      ),
    );
  }
}
