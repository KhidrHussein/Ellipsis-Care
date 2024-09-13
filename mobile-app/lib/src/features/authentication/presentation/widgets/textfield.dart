import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthenticationField extends StatelessWidget {
  final String fieldname;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AuthenticationField({
    super.key,
    this.validator,
    required this.hint,
    required this.fieldname,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldname,
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  final String fieldname;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    this.validator,
    required this.hint,
    required this.fieldname,
    required this.controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldname,
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: true,
          decoration: InputDecoration(
            hintText: widget.hint,
          ),
        ),
      ],
    );
  }
}
