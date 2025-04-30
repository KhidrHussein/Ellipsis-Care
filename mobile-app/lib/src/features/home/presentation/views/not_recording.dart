import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/config/gen/assets.gen.dart';

import '../../../../../core/utils/extensions.dart';
import '../../../../shared/widgets/appbar.dart';
import '../bloc/home_bloc.dart';

// final Map<String, String> _actions = {
//   AppAssets.icons.home.icAddReminder.path: "Add \nReminder",
//   AppAssets.icons.home.icSos.path: "SOS",
//   AppAssets.icons.home.icHealth.path: "Check health \nstatus",
// };

class NotRecording extends StatelessWidget {
  const NotRecording({super.key});

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
            AppAssets.icons.home.icMicrophone.path,
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
