import '../../../../../config/router/route_names.dart';
import '../../../../../core/utils/helpers.dart';
import '../widgets/contacts_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/extensions.dart';

import '../../../../../core/constants/asset_strings.dart';
import '../../../../shared/widgets/page_info.dart';

class SosPage extends StatelessWidget {
  const SosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => UtilHelpers.pushTo(RouteNames.callEmergencyContacts),
            child: Center(
              child: Container(
                height: 300.h,
                width: 300.h,
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                    shape: CircleBorder(), color: AppColors.red),
                child: Text(
                  "SOS",
                  style: context.textTheme.displayLarge?.copyWith(
                    fontSize: 96.sp,
                    // color: context.themeExtension.,
                    fontWeight: FontWeight.w700,
                    fontFamily: AssetStrings.visbyRoundCF,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child:
                PageInfo(info: "Click the SOS button in case of emergencies"),
          ),
          const ContactSheet()
        ],
      ),
    );
  }
}
