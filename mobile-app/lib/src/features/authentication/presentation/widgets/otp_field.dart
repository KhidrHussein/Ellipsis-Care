import 'package:flutter/services.dart';

import '../../../../../core/utils/helpers.dart';
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
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _nodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      6,
      (index) => TextEditingController(),
    );

    _nodes = List.generate(
      6,
      (index) => FocusNode(
        debugLabel: "Node $index",
        onKeyEvent: (node, event) {
          if (event is KeyDownEvent) {
            final isBackspace =
                event.logicalKey == LogicalKeyboardKey.backspace;

            // Handle Backspace key behavior
            if (isBackspace) {
              if (_controllers[index].text.isEmpty && index > 0) {
                _nodes[index - 1].requestFocus();
                return KeyEventResult.handled; // Mark as handled
              }
            } else {
              // Handle other key presses to move to the next node
              if (_controllers[index].text.isNotEmpty &&
                  index < _nodes.length - 1) {
                _nodes[index + 1].requestFocus();
                return KeyEventResult.handled; // Mark as handled
              }
            }

            // If no action matches, ignore the event
            return KeyEventResult.ignored;
          }

          // If not a KeyDownEvent, mark as handled
          return KeyEventResult.handled;
        },
      ),
    );
  }

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
    return FormField<String?>(
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
    );
  }

  Widget _buildTextField(TextEditingController controller, FocusNode focus) {
    return TextField(
      maxLength: 1,
      controller: controller,
      focusNode: focus,
      autofocus: true,
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
