import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/controller/cubit/medications_cubit.dart';

import '../../../../../../core/constants/colors.dart';

class Routine extends StatelessWidget {
  final String icon;
  final String name;
  final String timeAlloted;

  Routine({
    super.key,
    required this.icon,
    required this.name,
    required this.timeAlloted,
  });

  final ValueNotifier<bool> _checkBoxValue = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final medicationProgressCubit = context.read<MedicationProgressCubit>();

    return Padding(
      padding: REdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SvgPicture.asset(icon, width: 26),
          10.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: context.textTheme.titleMedium?.copyWith(
                  fontSize: 15.sp,
                ),
              ),
              Text(
                "$timeAlloted pm",
                style: context.textTheme.labelSmall?.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.medicationCardSubTextColor,
                ),
              )
            ],
          ),
          const Spacer(),
          ValueListenableBuilder(
            valueListenable: _checkBoxValue,
            builder: (context, value, child) {
              return Checkbox(
                value: value,
                onChanged: (value) {
                  // value == true
                  //     ? medicationProgressCubit.incrementProgress()
                  //     : medicationProgressCubit.decrementProgress();

                  _checkBoxValue.value = value ?? false;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
