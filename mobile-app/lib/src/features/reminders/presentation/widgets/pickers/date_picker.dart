import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';

import '../../../../../../core/constants/colors.dart';

class DatePicker extends StatefulWidget {
  final String hint;
  final ValueNotifier<DateTime?> listenable;
  const DatePicker({super.key, required this.hint, required this.listenable});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final OverlayPortalController _portalController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.generalOutlineBorder),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(
              valueListenable: widget.listenable,
              builder: (context, value, child) {
                return Text(
                  value != null
                      ? UtilHelpers.dateFormatter1(value)
                      : widget.hint,
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
                // _portalController.toggle();
                final result = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                widget.listenable.value = result;
              },
              child: OverlayPortal(
                controller: _portalController,
                overlayChildBuilder: (context) {
                  return Positioned(
                    left: .2.sw,
                    bottom: .4.sh,
                    child: Text("data"),
                  );
                },
                child: Icon(
                  Icons.calendar_month,
                  color: AppColors.black.withOpacity(.3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
