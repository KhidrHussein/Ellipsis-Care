import 'package:ellipsis_care/core/utils/helpers.dart';

import '../../../../../config/router/route_names.dart';
import '../../../../../core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmergencyContactTile extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final Uint8List? profilePicture;

  const EmergencyContactTile({
    super.key,
    required this.name,
    required this.phoneNumber,
    this.profilePicture,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UtilHelpers.pushRoute(RouteNames.emergencyCall),
      child: Container(
        margin: REdgeInsets.only(bottom: 4, left: 18, right: 18),
        padding: REdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.outlinedButtonBorder),
        ),
        child: Row(
          children: [
            if (profilePicture != null)
              CircleAvatar(
                radius: 22,
                backgroundImage: MemoryImage(profilePicture!),
              )
            else
              const CircleAvatar(),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    phoneNumber,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.emergencyContactNumberColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddEmergencyContact extends StatelessWidget {
  final VoidCallback? addContact;
  const AddEmergencyContact({super.key, this.addContact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addContact,
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 16),
        padding: REdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.outlinedButtonBorder),
        ),
        child: Row(
          children: [
            const Icon(Icons.add_circle_outline_outlined, size: 24),
            SizedBox(width: 12.w),
            Text(
              "Add new",
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
