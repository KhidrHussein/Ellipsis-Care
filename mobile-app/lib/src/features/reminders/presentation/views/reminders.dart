import 'package:ellipsis_care/core/constants/voice_commands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/reminder_bloc.dart';
import '../widgets/reminder_bar.dart';
import '../widgets/reminder_calendar.dart';
import '../widgets/reminder_sheet.dart';

class Reminders extends StatelessWidget {
  const Reminders({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderBloc = context.read<ReminderBloc>();

    return SafeArea(
      child: BlocListener<ReminderBloc, ReminderState>(
        listener: (context, state) async {
          if (state.spokenCommand.contains(VoiceCommands.addReminder)) {
            _handleVoiceCommand(context, reminderBloc);
          }
        },
        child: const Column(
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
      ),
    );
  }

  void _handleVoiceCommand(BuildContext context, ReminderBloc bloc) async {
    // final reminder = await showAdaptiveDialog(
    //   context: context,
    //   barrierDismissible: true,
    //   builder: (context) => const AddReminder(),
    // );

    // if (reminder != null) {
    //   bloc.add(
    //     CreateReminderEvent(
    //       name: reminder.name,
    //       dosage: reminder.dosage,
    //       type: reminder.type,
    //       interval: reminder.interval,
    //       schedule: reminder.schedule,
    //       instruction: reminder.instruction,
    //       startDate: reminder.startDate,
    //       endDate: reminder.endDate,
    //       eventStartTime: reminder.reminderStartTime,
    //       eventEndTime: reminder.reminderEndTime,
    //     ),
    //   );
    // }
  }
}
