import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OtpField extends StatefulWidget {
  final TextEditingController controller;

  const OtpField({super.key, required this.controller});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late ValueNotifier<bool> _hasError;

  @override
  void initState() {
    super.initState();
    _hasError = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _hasError,
      builder: (context, hasError, _) {
        return PinCodeTextField(
          maxLength: 6,
          pinBoxWidth: 45,
          pinBoxHeight: 45,
          pinBoxRadius: 5,
          pinBoxBorderWidth: 1,
          defaultBorderColor: Color(0xFFD0D5DD),
          hasTextBorderColor: AppColors.darkThemeMode,
          pinBoxOuterPadding: EdgeInsets.only(right: 8.w),
          pinTextStyle: context.textTheme.titleLarge?.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          hasError: hasError,
          controller: widget.controller,
          onTextChanged: (pin) {
            _hasError.value = pin.length != 6 && pin.isNotEmpty ? true : false;
          },
        );
      },
    );
  }
}
