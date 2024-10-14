import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../../../../../core/constants/colors.dart';

class DatePicker extends StatelessWidget {
  final String hint;
  final ValueNotifier<DateTime?> listenable;
  const DatePicker({super.key, required this.hint, required this.listenable});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textfieldBorder),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(
              valueListenable: listenable,
              builder: (context, value, child) {
                return Text(
                  value != null ? UtilHelpers.dateFormatter1(value) : hint,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: value != null
                        ? AppColors.black
                        : AppColors.black.withOpacity(.3),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () async {
                final result = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                listenable.value = result;
              },
              child: Icon(
                Icons.calendar_month,
                color: AppColors.black.withOpacity(.3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
