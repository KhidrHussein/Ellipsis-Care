import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/home/models/transcribed_response.dart';
import 'package:ellipsis_care/src/features/home/presentation/widgets/chat_bubble.dart';
import 'package:ellipsis_care/src/shared/page_info.dart';

import '../../../../../core/constants/asset_strings.dart';

class PromptResponses extends StatelessWidget {
  final List<TranscribedResponse> responses;
  const PromptResponses({super.key, required this.responses});

  @override
  Widget build(BuildContext context) {
    responses.printLog();
    return SingleChildScrollView(
      padding: REdgeInsets.only(top: 30),
      child: Column(
        children: [
          PageInfo(
                  info:
                      "The user taps the microphone and says a command such as “Remind me to take my medication at 9 AM.")
              .alignRight,
          40.verticalSpace,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: responses.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserChatBubble(
                      transcription: responses[index].transcription.first),
                  AIChatBubble(aiResponse: responses[index].aiResponse.first)
                ],
              );
            },
          ),
          Padding(
            padding: REdgeInsets.only(top: 33, bottom: 15),
            child: GestureDetector(
              onTap: () {},
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
