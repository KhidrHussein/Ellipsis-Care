import 'package:ellipsis_care/core/utils/helpers.dart';

import '../../../../../core/utils/extensions.dart';

import '../widgets/nearest_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../widgets/contacts_timer.dart';

class EmergencyCall extends StatelessWidget {
  const EmergencyCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.emergencyCallBgColor,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 19, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ContactsTimer(),
            20.sizedBoxHeight,
            Text(
              "Emergency calling...",
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 15.sp,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            10.sizedBoxHeight,
            Text(
              "Your contact, app users nearby, and your \n"
              "organization will see your request forhelp",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 11.sp,
                color: AppColors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            23.sizedBoxHeight,
            const NearestContacts(),
            75.sizedBoxHeight,
            FilledButton(
              onPressed: () {
                UtilHelpers.pop();
              },
              style: Theme.of(context).filledButtonTheme.style?.copyWith(
                    backgroundColor:
                        const WidgetStatePropertyAll(AppColors.white),
                    foregroundColor:
                        const WidgetStatePropertyAll(AppColors.black),
                    textStyle: WidgetStatePropertyAll(
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
              child: const Text("I am safe"),
            )
          ],
        ),
      ),
    );
  }
}
