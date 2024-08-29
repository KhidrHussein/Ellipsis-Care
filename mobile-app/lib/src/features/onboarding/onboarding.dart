import 'package:ellipsis_care/config/router/route_names.dart';
import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';

import 'package:ellipsis_care/core/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  final PageController _viewController = PageController();

  @override
  void dispose() {
    _viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _viewController,
          itemCount: _stories.length,
          onPageChanged: (value) {
            setState(() => _currentPage = value);
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: REdgeInsets.fromLTRB(16.w, 64.h, 16.w, 20.h),
              child: Column(
                children: [
                  SizedBox(
                    width: 306.w,
                    child: Text(
                      _stories[index].title,
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
                      _stories[index].body,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _stories
                        .map(
                          (story) => AnimatedContainer(
                            duration: Durations.long1,
                            width: story.id == _currentPage ? 33.w : 8.w,
                            height: 8.h,
                            margin: REdgeInsets.only(right: 6.w),
                            decoration: BoxDecoration(
                              color: AppColors.pageviewIndicator,
                              borderRadius: story.id == _currentPage
                                  ? BorderRadius.circular(100.r)
                                  : BorderRadius.circular(33.r),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 16.h),
                  FilledButton(
                    onPressed: () => _stories[index].action(_viewController),
                    child: Text(_stories[index].buttonText),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class OnboardStory {
  final int id;
  final String title;
  final String body;
  final String buttonText;
  final void Function(PageController) action;

  OnboardStory({
    required this.id,
    required this.title,
    required this.body,
    required this.buttonText,
    required this.action,
  });
}

final List<OnboardStory> _stories = [
  OnboardStory(
    id: 0,
    title: "Welcome to Ellipses Care",
    body: "Your health, simplified. Ellipses Care is your personal health "
        "companion, here to ensure you stay on top of your "
        "well-being—anytime, anywhere.",
    buttonText: "Get Started",
    action: (controller) {
      controller.nextPage(duration: Durations.long1, curve: Curves.linear);
    },
  ),
  OnboardStory(
    id: 1,
    title: "Personalise Your Care Experience",
    body: "Let’s create a profile tailored to your needs. "
        "We’ll guide you through a quick setup to gather essential "
        "health details, medications, and preferences. "
        "All voice-guided, with minimal typing required.",
    buttonText: "Start Setup",
    action: (controller) {
      controller.nextPage(duration: Durations.long1, curve: Curves.linear);
    },
  ),
  OnboardStory(
    id: 2,
    title: "Stay Informed, Every Day",
    body: "Get a clear overview of your daily health. "
        "From medication reminders to activity suggestions, "
        "everything you need is in one place, with real-time "
        "feedback to help you stay on track.",
    buttonText: "Start Setup",
    action: (controller) {
      controller.nextPage(duration: Durations.long1, curve: Curves.linear);
    },
  ),
  OnboardStory(
    id: 3,
    title: "Your AI-Driven Health Assistant",
    body: "Get a clear overview of your daily health. "
        "From medication reminders to activity suggestions, "
        "everything you need is in one place, with real-time "
        "feedback to help you stay on track.",
    buttonText: "Set Up Assistant",
    action: (controller) {
      controller.nextPage(duration: Durations.long1, curve: Curves.linear);
    },
  ),
  OnboardStory(
    id: 4,
    title: "Safety, First and Always",
    body: "In case of an emergency, help is just a tap away. "
        "Quickly alert emergency contacts or medical services with "
        "our one-touch emergency button, ensuring you’re never alone in a crisis.",
    buttonText: "Set Up Emergency Contacts",
    action: (controller) {
      controller.nextPage(duration: Durations.long1, curve: Curves.linear);
    },
  ),
  OnboardStory(
    id: 5,
    title: "Simple, Accessible, and Inclusive",
    body: "Our clean, black-and-white interface is designed "
        "with accessibility in mind. Choose your language and "
        "personalize your settings for a seamless experience, "
        "even if you’re new to technology.",
    buttonText: "Customize Your Experience",
    action: (controller) {
      controller.nextPage(duration: Durations.long1, curve: Curves.linear);
    },
  ),
  OnboardStory(
    id: 6,
    title: "You’re Ready to Go",
    body: "Your personalised health assistant is "
        "now ready to help you live healthier, every day. "
        "Let’s start your journey to better health together.",
    buttonText: "Go to Dashboard",
    action: (controller) => UtilHelpers.pushRoute(RouteNames.signup),
  ),
];
