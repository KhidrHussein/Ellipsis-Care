import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ellipsis_care/core/services/hive_storage_service.dart';
import 'package:ellipsis_care/core/utils/injector.dart';

import '../../../../config/router/route_names.dart';
import '../../../../core/services/contacts_service.dart';
import '../../../../core/services/mic_service.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/services/sms_service.dart';
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
        _setupEmergencyServices();
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
    await mic.checkForPermission().then((hasPermission) => _nextStory());
  }

  void _initializeSpeechToTextService() async {
    final voiceCommandService = injector<VoiceCommandService>();
    await voiceCommandService.init().then((value) => _nextStory());
  }

  void _initializeNotificationServiceChannel() async {
    final hiveStorage = injector<HiveStorageService>();
    final notificationService = injector<NotificationService>();

    await notificationService.checkForPermission().then((permission) async {
      await hiveStorage.getSettings().then((settings) async {
        settings?.isNotificationEnabled = permission ?? false;
        await settings?.save();
      });
      _nextStory();
    });
  }

  void _setupEmergencyServices() async {
    final phoneService = injector<PhoneContactService>();
    final smsService = injector<SmsService>();
    final hiveStorage = injector<HiveStorageService>();

    await phoneService.checkForPermission().then((permission) async {
      await smsService.askForPermission().then((value) async {
        if (permission == true) {
          final contact = await phoneService.pickContact();
          await hiveStorage.storeEmergencyContact(contact);
        }
      });
      _nextStory();
    });
  }

  void _nextStory() {
    slideController.nextPage(duration: Durations.long1, curve: Curves.linear);
  }
}
