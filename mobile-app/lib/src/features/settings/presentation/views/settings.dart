import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:flutter/widgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Settings")
        ],
      ),
    );
  }
}
