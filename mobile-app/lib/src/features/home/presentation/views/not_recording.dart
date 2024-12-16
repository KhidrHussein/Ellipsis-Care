import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/src/shared/widgets/navigator_shell/navigator_shell.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/asset_strings.dart';
import '../../../../../core/utils/extensions.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_action_chip.dart';

import '../../../../shared/widgets/appbar.dart';

class NotRecording extends StatelessWidget {
  const NotRecording({super.key});

  final Map<String, String> _actions = const {
    AssetStrings.addReminderIcon: "Add \nReminder",
    AssetStrings.sosIcon: "SOS",
    AssetStrings.healthStatusIcon: "Check health \nstatus",
  };

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    return Column(
      children: [
        const ProfileBar(),
        const Spacer(),
        GestureDetector(
          onTap: () {
            homeBloc.add(StartRecordingEvent());
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
        // Padding(
        //   padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
        //   child: Row(
        //     children: _actions.entries.map((asset) {
        //       return HomeActionChip(
        //         icon: asset.key,
        //         title: asset.value,
        //         onTap: switch (asset.key) {
        //           AssetStrings.addReminderIcon => () {
        //             context.read<NavigationRowCubit>().goToRoute(RouteNames.reminders);
        //           },
        //           AssetStrings.sosIcon => () {},
        //           AssetStrings.healthStatusIcon => () {},
        //           _ => null
        //         },
        //       );
        //     }).toList(),
        //   ),
        // )
      ],
    );
  }
}
