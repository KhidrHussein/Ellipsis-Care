import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/utils.dart';
import 'package:flutter/material.dart';

class HealthOptionPicker extends StatelessWidget {
  const HealthOptionPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DashboardBloc>();

    return DropdownMenu<HealthOptions>(
      initialSelection: bloc.state.healthOption,
      textStyle: context.textTheme.labelSmall,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        constraints: BoxConstraints(maxWidth: 96, maxHeight: 48.h),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.editTextFieldColorLight),
          borderRadius: BorderRadius.circular(7.r),
        ),
      ),
      onSelected: (value) {
        context
            .read<DashboardBloc>()
            .add(PickHealthOptionEvent(option: value!));
      },
      dropdownMenuEntries: HealthOptions.values
          .map(
            (option) => DropdownMenuEntry<HealthOptions>(
              value: option,
              label: option.unitsOfMeasurement.first,
              labelWidget: Text(
                option.unitsOfMeasurement.first,
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          )
          .toList(),
    );
  }
}
