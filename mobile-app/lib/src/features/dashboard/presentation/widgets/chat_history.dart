import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/dashboard_bloc.dart';

class ChatHistory extends StatelessWidget {
  const ChatHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 72.h),
        InkWell(
          onLongPress: () {
             context.read<DashboardBloc>().add(StartMicrophoneEvent());
          },
          onTap: () {
           
          },
          customBorder: const CircleBorder(),
          child: Container(
            width: 76.w,
            height: 76.h,
            decoration: BoxDecoration(
              border: Border.all(width: .5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.mic_none,
              size: 48,
            ),
          ),
        ),
      ],
    );
  }
}
