import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:pulsator/pulsator.dart';

import '../../../../../core/constants/colors.dart';
import '../bloc/bloc.dart';

class ContactsTimer extends StatelessWidget {
  const ContactsTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145.h,
      width: 145.h,
      child: Pulsator(
        duration: const Duration(seconds: 5),
        style: PulseStyle(
          color: AppColors.emergencyCallBgColor,
          borderColor: AppColors.white,
          borderWidth: 4.w,
        ),
        child: Container(
          width: 65.w,
          height: 65.h,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: BlocBuilder<EmergencyContactBloc, EmergencyContactState>(
            builder: (context, state) {
              return Container(
                width: 65.w,
                height: 65.h,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "${state.contacts.length}",
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
