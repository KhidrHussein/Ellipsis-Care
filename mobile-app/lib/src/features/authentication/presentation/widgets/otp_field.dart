
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/extensions/context_ext.dart';

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
  void initState() {
    super.initState();
    _nodes[0].requestFocus();

    for (int i = 0; i < (_controllers.length - 1); i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty && _nodes[i].hasFocus) {
          FocusScope.of(context).nextFocus();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
