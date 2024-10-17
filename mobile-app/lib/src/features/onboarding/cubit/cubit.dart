import 'package:ellipsis_care/core/services/notification_service.dart';

import '../../../../core/services/contacts_service.dart';
import '../../../../core/services/speech_service.dart';
import 'package:ellipsis_care/core/services/storage_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/route_names.dart';
import '../../../../core/services/mic_service.dart';
import '../../../../core/utils/helpers.dart';

part 'state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super((currentIndex: 0, story: stories.first)) {
    injector<StorageService>().initSession();
  }

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

      case 2:
        _initializeNotificationServiceChannel();
        break;

      case 3:
        _initializeSpeechToTextService();
        break;

      case 4:
        _setupEmergencyContacts();
        break;

      case 6:
        _hasViewedOnboarding();
        UtilHelpers.pushRoute(RouteNames.signup);
        break;

      default:
        _nextStory();
    }
  }

  void _hasViewedOnboarding() async {
    final session = await injector<StorageService>().getUserData();
    session!.hasViewedOnboarding = true;
    await session.save();
  }

  void _initializeAudio() async {
    final mic = injector<MicrophoneService>();

    await mic.checkForPermission().then((hasPermission) {
      "${mic.runtimeType} has permission? $hasPermission".printLog();
      _nextStory();
    });
  }

  void _initializeSpeechToTextService() async {
    final speech = injector<SpeechService>();

    await speech.init().then((hasInitialized) {
      "${speech.runtimeType} has initialized? $hasInitialized".printLog();
      _nextStory();
    });
  }

  void _initializeNotificationServiceChannel() async {
    final notificationService = injector<NotificationService>();

    await notificationService.checkForPermission().then((hasPermission) async {
      
      "${notificationService.runtimeType} has permission? $hasPermission".printLog();
      _nextStory();
    });
  }

  void _setupEmergencyContacts() async {
    final phoneService = injector<PhoneContactService>();

    await phoneService.checkForPermission().then((hasPermission) async {
      "${phoneService.runtimeType} has permission? $hasPermission".printLog();

      if (hasPermission) {
        final contact = await phoneService.pickContact();
        injector<StorageService>().storeEmergencyContact(contact);
      }

      _nextStory();
    });
  }

  void _nextStory() {
    slideController.nextPage(duration: Durations.long1, curve: Curves.linear);
  }
}
