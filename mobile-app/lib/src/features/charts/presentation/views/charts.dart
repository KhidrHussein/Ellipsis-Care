import '../../../../../core/utils/extensions.dart';
import 'package:flutter/widgets.dart';

class Charts extends StatelessWidget {
  const Charts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Coming soon",
            style: context.textTheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
