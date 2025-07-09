import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions.dart';
import '../widgets/dashboard_appbar.dart';

class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            DashboardAppbar(
              title: "Add Data",
              showSaveButton: true,
              onSaveButtonPressed: () {},
            ),
            30.sizedBoxHeight,
            _DataSection(name: "Time", input: Text("data")),
            _DataSection(
              name: "Weight",
              input: SizedBox(),
              output: Row(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DataSection extends StatelessWidget {
  const _DataSection({required this.name, this.input, this.output});

  final String name;
  final Widget? input;
  final Widget? output;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(bottom: 10),
      padding: REdgeInsets.all(5),
      decoration: BoxDecoration(
        color: context.themeData.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                name,
                style: context.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Spacer(),
              if (input != null) input!
            ],
          ),
          if (output != null) output!,
        ],
      ),
    );
  }
}
