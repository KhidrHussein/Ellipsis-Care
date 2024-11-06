import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/chat_bubble.dart';

import '../../../../../core/constants/asset_strings.dart';

class PromptResponses extends StatelessWidget {
  const PromptResponses({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Semantics(
              onTap: () {},
              container: true,
              onTapHint: "Kisss",
              tooltip: "Something",
              child: Icon(Icons.info_outline),
            ).alignRight,
          ),
          const Spacer(flex: 1),
          Flexible(
            flex: 10,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ChatBubble(
                  data: "Some data",
                  isUser: index % 2 == 0,
                );
              },
            ),
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
