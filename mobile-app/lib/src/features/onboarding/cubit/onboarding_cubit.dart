import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/hive_storage_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/injector.dart';

import '../../../../config/router/route_names.dart';
import '../../../../core/services/contacts_service.dart';
import '../../../../core/services/mic_service.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/services/voice_command_service.dart';
import '../../../../core/utils/helpers.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(
          (currentIndex: 0, story: stories.first),
        );

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
      case 0:
        _initializeAudio();
        break;

      case 1:
        _initializeNotificationServiceChannel();
        break;

      case 2:
        _initializeSpeechToTextService();
        break;

      case 3:
        _setupEmergencyContacts();
        break;

      case 4:
        _hasViewedOnboarding();
        break;

      default:
        _nextStory();
    }
  }

  void _hasViewedOnboarding() async {
    final userdata = await injector<HiveStorageService>().getAppSession();
    userdata?.hasUserOnboard = true;
    await userdata?.save().then((value) {
      UtilHelpers.pushTo(RouteNames.signup);
    });
  }

  void _initializeAudio() async {
    final mic = injector<MicrophoneService>();
    await mic.checkForPermission().then((hasPermission) {
      "${mic.runtimeType} has permission? $hasPermission".printLog();
      _nextStory();
    });
  }

  void _initializeSpeechToTextService() async {
    final voiceCommandService = injector<VoiceCommandService>();
    await voiceCommandService.init().then((hasInitialized) {
      "${voiceCommandService.runtimeType} has permission? $hasInitialized"
          .printLog();
      _nextStory();
    });
  }

  void _initializeNotificationServiceChannel() async {
    final notificationService = injector<NotificationService>();

    await notificationService.checkForPermission().then((hasPermission) async {
      "${notificationService.runtimeType} has permission? $hasPermission"
          .printLog();

      final settings = await injector<HiveStorageService>().getSettings();
      settings?.isNotificationEnabled = hasPermission;
      await settings?.save();

      _nextStory();
    });
  }

  void _setupEmergencyContacts() async {
    final phoneService = injector<PhoneContactService>();

    await phoneService.checkForPermission().then((hasPermission) async {
      "${phoneService.runtimeType} has permission? $hasPermission".printLog();

      if (hasPermission) {
        final contact = await phoneService.pickContact();
        injector<HiveStorageService>().storeEmergencyContact(contact);
      }

      _nextStory();
    });
  }

  void _nextStory() {
    slideController.nextPage(duration: Durations.long1, curve: Curves.linear);
  }
}
