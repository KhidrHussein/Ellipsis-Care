import 'package:ellipsis_care/core/services/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/route_names.dart';
import '../../../../core/services/mic_service.dart';
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

  void nextSlide() async {
    switch (state.currentIndex) {
      case 1:
        _initializeAudio();
        slideController.nextPage(
            duration: Durations.long1, curve: Curves.linear);
        break;

      case 4:
        _addEmergencyContacts();
        slideController.nextPage(
            duration: Durations.long1, curve: Curves.linear);
        break;

      case 6:
        UtilHelpers.pushRoute(RouteNames.signup);
        break;

      default:
        slideController.nextPage(
            duration: Durations.long1, curve: Curves.linear);
    }
  }

  void _initializeAudio() async {
    final mic = AudioService.instance;
    await mic.checkForPermission().then((value) {
      debugPrint("$value");
    });
  }

  void _addEmergencyContacts() async {
    final service = EmergencyContactsService.instance;
    await service.pickContacts().then((value) {
      debugPrint("$value");
    });
  }
}
