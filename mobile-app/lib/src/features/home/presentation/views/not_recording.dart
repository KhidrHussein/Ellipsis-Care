import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/home/presentation/controller/microphone_bloc/mic_bloc.dart';
import 'package:ellipsis_care/src/features/home/presentation/widgets/home_action_chip.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/helpers.dart';
import '../../../../shared/appbar.dart';

class NotRecording extends StatelessWidget {
  const NotRecording({super.key});

  final Map<String, String> _actions = const {
    AssetStrings.addReminderIcon: "Add \nReminder",
    AssetStrings.sosIcon: "SOS",
    AssetStrings.healthStatusIcon: "Check health \nstatus",
  };

  @override
  Widget build(BuildContext context) {
    final micBloc = context.read<MicrophoneBloc>();

    return Column(
      children: [
        const ProfileBar(),
        const Spacer(),
        GestureDetector(
          onTap: () {
            UtilHelpers.pushRoute(RouteNames.recording);
            micBloc.add(StartRecordingEvent());
          },
          child: SvgPicture.asset(
            AssetStrings.microphoneIcon,
            colorFilter: ColorFilter.mode(
              context.themeExtension.homeIconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        40.sizedBoxHeight,
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            children: _actions.entries.map((asset) {
              return HomeActionChip(
                icon: asset.key,
                title: asset.value,
                onTap: switch (asset.key) {
                  AssetStrings.addReminderIcon => () {},
                  AssetStrings.sosIcon => () {},
                  AssetStrings.healthStatusIcon => () {},
                  _ => null
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
