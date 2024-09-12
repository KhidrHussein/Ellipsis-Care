import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/extensions/context_ext.dart';
import 'package:ellipsis_care/src/features/onboarding/cubit/cubit.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: stories.length,
                controller: cubit.slideController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) => cubit.updateState(value),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: REdgeInsets.fromLTRB(16.w, 64.h, 16.w, 20.h),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 306.w,
                          child: Text(
                            stories[index].title,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Expanded(
                          child: Text(
                            stories[index].body,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              bloc: cubit,
              // listener: (context, state) {
              //   if (state.currentIndex == 4) {
              //     context
              //         .read<EmergencyContactBloc>()
              //         .add(AddMultipleContactsEvent());
              //   }
              // },
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: stories
                          .map(
                            (story) => AnimatedContainer(
                              duration: Durations.long1,
                              width:
                                  state.currentIndex == story.id ? 33.w : 8.w,
                              height: 8.h,
                              margin: REdgeInsets.only(right: 6.w),
                              decoration: BoxDecoration(
                                color: AppColors.pageviewIndicator,
                                borderRadius: state.currentIndex == story.id
                                    ? BorderRadius.circular(100.r)
                                    : BorderRadius.circular(33.r),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 16.h),
                    FilledButton(
                      onPressed: cubit.nextSlide,
                      child: Text(state.story.buttonText),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
