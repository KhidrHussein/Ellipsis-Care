import '../../../../../core/enums/health_options.dart';
import 'package:flutter/material.dart';


class HealthOptionPicker extends StatelessWidget {
  const HealthOptionPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<HealthOptions>(
      // elevation: 4,
      // menuWidth: 84.w,
      // isExpanded: true,
      // borderRadius: BorderRadius.circular(5.r),
      // padding: REdgeInsets.only(left: 12),
      // style: context.textTheme.labelSmall?.copyWith(
      //   fontSize: 16.sp,
      //   fontWeight: FontWeight.w400,
      //   color: AppColors.black.withOpacity(.87),
      // ),
      // underline: const SizedBox(),
      // value: HealthOptions.bloodPressure,
      // items: HealthOptions.values
      //     .map(
      //       (option) => DropdownMenuItem<HealthOptions>(
      //         value: option,
      //         child: Text(option.unitsOfMeasurement.first),
      //       ),
      //     )
      //     .toList(),
      // onChanged: (value) {}, 
      dropdownMenuEntries: HealthOptions.values
          .map(
            (option) => DropdownMenuEntry<HealthOptions>(
              value: option,
              label: option.name,
              labelWidget: Text(option.unitsOfMeasurement.first),
            ),
          )
          .toList(),
    );
  }
}
