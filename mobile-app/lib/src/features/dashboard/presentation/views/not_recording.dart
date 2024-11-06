import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/constants/asset_strings.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/widgets/dashboard_action_chip.dart';

class NotRecording extends StatelessWidget {
  const NotRecording({super.key});

  final Map<String, String> _actions = const {
    AssetStrings.addReminderIcon: "Add \nReminder",
    AssetStrings.sosIcon: "SOS",
    AssetStrings.healthStatusIcon: "Check health \nstatus",
  };

  @override
  Widget build(BuildContext context) {
    final dashboardBloc = context.read<DashboardBloc>();

    return Column(
      children: [
        GestureDetector(
          onTap: () => dashboardBloc.add(StartRecordingEvent()),
          child: SvgPicture.asset(AssetStrings.microphoneIcon),
        ),
        40.sizedBoxHeight,
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            children: _actions.entries
                .map((asset) =>
                    DashboardActionChip(icon: asset.key, title: asset.value))
                .toList(),
          ),
        )
      ],
    );
  }
}
