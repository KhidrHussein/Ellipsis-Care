import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/emergency/presentation/widgets/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/appbar.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileBar(profileName: "Leonard"),
            SizedBox(height: 24.h),
            Text(
              "Emergency Contacts",
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 48.h),
            const EmergencyContactsList()
          ],
        ),
      ),
    );
  }
}
