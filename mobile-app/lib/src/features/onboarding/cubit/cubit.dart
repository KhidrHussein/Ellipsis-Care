import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/route_names.dart';
import '../../../../core/utils/helpers.dart';

part 'state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super((currentIndex: 0, story: stories.first));

  final PageController slideController = PageController();

  void updateState(int newId) {
    emit(
      copyWithNewState(
        state: state,
        newIndex: newId,
        newStory: stories.elementAt(newId),
      ),
    );
  }

  void nextSlide() {
    if (state.currentIndex == stories.length - 1) {
      UtilHelpers.pushRoute(RouteNames.signup);
    }

    slideController.nextPage(duration: Durations.long1, curve: Curves.linear);
  }
}
