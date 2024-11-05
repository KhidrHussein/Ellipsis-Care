import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';

class OtpField extends StatefulWidget {
  final TextEditingController controller;

  const OtpField({super.key, required this.controller});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _nodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (int i = 0; i < (_controllers.length - 1); i++) {
      _controllers[i].dispose();
      _nodes[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: false,
      child: FormField<String?>(
        validator: (code) => UtilHelpers.otpValidator(code),
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextField(_controllers[0], _nodes[0]),
                  SizedBox(width: 8.w),
                  _buildTextField(_controllers[1], _nodes[1]),
                  SizedBox(width: 8.w),
                  _buildTextField(_controllers[2], _nodes[2]),
                  SizedBox(width: 6.w),
                  Text(
                    "-",
                    style: context.textTheme.displayMedium,
                  ),
                  SizedBox(width: 6.w),
                  _buildTextField(_controllers[3], _nodes[3]),
                  SizedBox(width: 8.w),
                  _buildTextField(_controllers[4], _nodes[4]),
                  SizedBox(width: 8.w),
                  _buildTextField(_controllers[5], _nodes[5]),
                ],
              ),
              if (state.hasError)
                Padding(
                  padding: REdgeInsets.only(left: 14, top: 6),
                  child: Text(
                    state.errorText ?? "",
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: AppColors.red),
                  ),
                )
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, FocusNode focus) {
    return TextField(
      maxLength: 1,
      controller: controller,
      focusNode: focus,
      buildCounter: (context,
              {required currentLength,
              required isFocused,
              required maxLength}) =>
          const SizedBox(),
      onChanged: (pin) => widget.controller.text += pin,
      autofillHints: const [AutofillHints.oneTimeCode],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: 45.w),
      ),
    );
  }
}
