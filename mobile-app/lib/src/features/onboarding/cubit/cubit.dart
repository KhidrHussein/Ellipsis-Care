import 'package:ellipsis_care/core/services/contacts_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
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
        break;

      case 4:
        _setupEmergencyContacts();
        break;

      case 6:
        UtilHelpers.pushRoute(RouteNames.signup);
        break;

      default:
        _nextStory();
    }
  }

  void _initializeAudio() async {
    final mic = injector<MicrophoneService>();

    await mic.checkForPermission().then((hasAudioPermission) {
      "$hasAudioPermission".printLog();
      _nextStory();
    });
  }

  void _setupEmergencyContacts() async {
    final service = injector<PhoneContactService>();

    await service.checkForPermission().then((hasContactsPermission) async {
      "$hasContactsPermission".printLog();

      if (hasContactsPermission) {
        final contact = await service.pickContact();
        contact.printLog();
      }

      _nextStory();
    });
  }

  void _nextStory() {
    slideController.nextPage(duration: Durations.long1, curve: Curves.linear);
  }
}
