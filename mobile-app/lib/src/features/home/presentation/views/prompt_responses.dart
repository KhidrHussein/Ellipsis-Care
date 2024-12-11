import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/src/features/home/presentation/bloc/home_bloc.dart';

import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/utils/extensions.dart';
import '../../models/home_response.dart';
import '../widgets/chat_bubble.dart';

class PromptResponses extends StatelessWidget {
  final List<HomeResponse> responses;
  const PromptResponses({super.key, required this.responses});

  @override
  Widget build(BuildContext context) {
    responses.printLog();
    return SingleChildScrollView(
      padding: REdgeInsets.only(top: 30),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: responses.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserChatBubble(transcription: responses[index].user.first),
                  AIChatBubble(aiResponse: responses[index].ai.first)
                ],
              );
            },
          ),
          .4.sh.verticalSpace,
          Padding(
            padding: REdgeInsets.only(top: 33, bottom: 15),
            child: GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(StartRecordingEvent());
              },
              child: SvgPicture.asset(
                AssetStrings.microphoneIcon,
                colorFilter: ColorFilter.mode(
                  context.themeExtension.homeIconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
