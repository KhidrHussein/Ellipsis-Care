import '../../../../../core/constants/asset_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/emergency_bloc.dart';
import 'help_circle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pulsator/pulsator.dart';

import '../../../../../core/constants/colors.dart';

final List<Alignment> _geometry = [
  Alignment.topCenter,
  Alignment.centerLeft,
  Alignment.centerRight,
  Alignment.bottomCenter,
];

class NearestContacts extends StatelessWidget {
  const NearestContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmergencyContactBloc, EmergencyState>(
      builder: (context, state) {
        return SizedBox(
          height: 257.h,
          width: 247.w,
          child: Stack(
            children: [
              Pulsator(
                count: 4,
                style: PulseStyle(
                  color: AppColors.emergencyCallBgColor,
                  borderColor: AppColors.white,
                  borderWidth: 4.w,
                ),
                child: Align(
                  child: Container(
                    width: 55.w,
                    height: 55.h,
                    padding: REdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(AssetStrings.sosBroadcast),
                  ),
                ),
              ),
              if (state.contacts.length <= 4)
                ...state.contacts.asMap().entries.map(
                      (item) => Align(
                        alignment: _geometry[item.key],
                        child: HelpCircle(picture: item.value.photo),
                      ),
                    )
              else
                ...state.contacts.sublist(0, 4).asMap().entries.map(
                      (item) => Align(
                        alignment: _geometry[item.key],
                        child: HelpCircle(picture: item.value.photo),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
