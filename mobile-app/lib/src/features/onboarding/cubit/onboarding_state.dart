part of 'onboarding_cubit.dart';

typedef OnboardingState = ({int currentIndex, OnboardStory story});

OnboardingState copyWithNewState({
  required OnboardingState state,
  int? newIndex,
  OnboardStory? newStory,
}) {
  return (
    currentIndex: newIndex ?? state.currentIndex,
    story: newStory ?? state.story,
  );
}

class OnboardStory {
  OnboardStory({
    required this.id,
    required this.title,
    required this.body,
    required this.buttonText,
  });

  final int id;
  final String title;
  final String body;
  final String buttonText;
}

final List<OnboardStory> stories = [
  OnboardStory(
    id: 0,
    title: "Welcome to Ellipses Care",
    body: "Your health, simplified. Ellipses Care is your personal health "
        "companion, here to ensure you stay on top of your "
        "well-being—anytime, anywhere.",
    buttonText: "Get Started",
  ),
  OnboardStory(
    id: 1,
    title: "Personalise Your Care Experience",
    body: "Let’s create a profile tailored to your needs. "
        "We’ll guide you through a quick setup to gather essential "
        "health details, medications, and preferences. "
        "All voice-guided, with minimal typing required.",
    buttonText: "Start Setup",
  ),
  OnboardStory(
    id: 2,
    title: "Stay Informed, Every Day",
    body: "Get a clear overview of your daily health. "
        "From medication reminders to activity suggestions, "
        "everything you need is in one place, with real-time "
        "feedback to help you stay on track.",
    buttonText: "Start Setup",
  ),
  OnboardStory(
    id: 3,
    title: "Your AI-Driven Health Assistant",
    body: "Get a clear overview of your daily health. "
        "From medication reminders to activity suggestions, "
        "everything you need is in one place, with real-time "
        "feedback to help you stay on track.",
    buttonText: "Set Up Assistant",
  ),
  OnboardStory(
    id: 4,
    title: "Safety, First and Always",
    body: "In case of an emergency, help is just a tap away. "
        "Quickly alert emergency contacts or medical services with "
        "our one-touch emergency button, ensuring you’re never alone in a crisis.",
    buttonText: "Set Up Emergency Contacts",
  ),
  OnboardStory(
    id: 5,
    title: "Simple, Accessible, and Inclusive",
    body: "Our clean, black-and-white interface is designed "
        "with accessibility in mind. Choose your language and "
        "personalize your settings for a seamless experience, "
        "even if you’re new to technology.",
    buttonText: "Customize Your Experience",
  ),
  OnboardStory(
    id: 6,
    title: "You’re Ready to Go",
    body: "Your personalised health assistant is "
        "now ready to help you live healthier, every day. "
        "Let’s start your journey to better health together.",
    buttonText: "Go to Dashboard",
  ),
];
