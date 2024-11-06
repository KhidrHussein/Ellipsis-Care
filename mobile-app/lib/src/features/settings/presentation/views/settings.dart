import 'package:flutter/widgets.dart';

import '../widgets/user_profile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          UserProfile(),
        ],
      ),
    );
  }
}
