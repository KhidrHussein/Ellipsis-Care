import 'package:flutter/widgets.dart';

import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_bar.dart';
import 'package:ellipsis_care/src/features/settings/presentation/widgets/settings_options.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          SettingsBar(),
          Expanded(
            child: SettingsOptions(),
          )
        ],
      ),
    );
  }
}
