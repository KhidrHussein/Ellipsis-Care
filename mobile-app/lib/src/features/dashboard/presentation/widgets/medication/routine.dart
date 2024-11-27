import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/extensions.dart';
import '../../controller/cubit/medications_cubit.dart';

import '../../../../../../core/constants/colors.dart';

class Routine extends StatelessWidget {
  final String icon;
  final String name;
  final String timeAlloted;

  const Routine({
    super.key,
    required this.icon,
    required this.name,
    required this.timeAlloted,
  });

  @override
  Widget build(BuildContext context) {
    final medicationProgressCubit = context.watch<MedicationProgressCubit>();

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
          BlocBuilder<MedicationProgressCubit, Map<String, bool>>(
            bloc: medicationProgressCubit,
            builder: (context, state) {
              return Checkbox(
                value: state[name],
                onChanged: (value) {
                  context
                      .read<MedicationProgressCubit>()
                      .hasPassedRoutine(name, value!);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
