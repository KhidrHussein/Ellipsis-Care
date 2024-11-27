import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/extensions.dart';

class RadioTypePicker<T> extends StatefulWidget {
  final T value;
  final String option;
  final void Function(T?) onInstructionSelected;

  const RadioTypePicker({
    super.key,
    required this.value,
    required this.option,
    required this.onInstructionSelected,
  });

  @override
  State<RadioTypePicker<T>> createState() => _RadioTypePickerState<T>();
}

class _RadioTypePickerState<T> extends State<RadioTypePicker<T>> {
  T? _groupValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox.fromSize(
            size: const Size.square(26),
            child: Radio<T>(
              toggleable: true,
              value: widget.value,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value;
                  widget.onInstructionSelected(value);
                });
              },
            ),
          ),
          3.sizedBoxWidth,
          Text(
            widget.option,
            style: context.textTheme.labelLarge?.copyWith(fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
