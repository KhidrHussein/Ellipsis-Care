import 'package:ellipsis_care/src/features/home/models/transcribed_response.dart';
import 'package:ellipsis_care/src/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/home/presentation/widgets/chat_bubble.dart';

import '../../../../../core/constants/asset_strings.dart';

class PromptResponses extends StatelessWidget {
  const PromptResponses({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    return SafeArea(
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Semantics(
          //     onTap: () {},
          //     container: true,
          //     onTapHint: "Kisss",
          //     tooltip: "Something",
          //     child: Icon(Icons.info_outline),
          //   ).alignRight,
          // ),
          const Spacer(flex: 1),

          BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            builder: (context, state) {
              return switch (state) {
                EndRecordingState(
                  :List<TranscribedResponse> transcribedResult
                ) =>
                  Flexible(
                      flex: 10,
                      child: ChatBubble(
                        aiResponse: transcribedResult.first.aiResponse.first,
                        transcription:
                            transcribedResult.first.transcription.first,
                        isUser: transcribedResult.first.aiResponse.first ==
                            transcribedResult.first.transcription.first,
                      )

                      // ListView.builder(
                      //   itemCount: transcribedResult.length,
                      //   itemBuilder: (context, index) {
                      //     final ai = transcribedResult[index].aiResponse.first;
                      //     final user =
                      //         transcribedResult[index].transcription.first;

                      //     return ChatBubble(
                      //       aiResponse: ai,
                      //       transcription: user,
                      //       isUser: ai != user,
                      //     );
                      //   },
                      // ),
                      ),
                _ => const SizedBox(),
              };
            },
          ),
          Padding(
            padding: REdgeInsets.only(top: 33, bottom: 15),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(AssetStrings.microphoneIcon),
            ),
          ),
        ],
      ),
    );
  }
}
