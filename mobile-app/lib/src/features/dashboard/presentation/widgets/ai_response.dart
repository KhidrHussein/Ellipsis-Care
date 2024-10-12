import '../../domain/health_tip.dart';
import '../bloc/bloc.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiResponse extends StatelessWidget {
  final HealthTip? response;
  const AiResponse({super.key, this.response});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (response != null)
          Column(
            children: [
              ChatBubble(data: response!.transcription),
              ChatBubble(data: response!.ai_response, isUser: false),
            ],
          ),
        SizedBox(height: 72.h),
        InkWell(
          onTap: () {
            context.read<DashboardBloc>().add(StartRecordingEvent());
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
