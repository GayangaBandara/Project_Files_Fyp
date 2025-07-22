import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'user_details_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Welcome to SafeSpace 💚',
      subTitle:
          'A supportive space to care for your mental health with AI guidance.',
      imageUrl: 'assets/images/welcome.png',
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
      subTitleTextStyle: TextStyle(
        fontSize: 16,
        overflow: TextOverflow.visible,
      ),
    ),
    Introduction(
      title: 'Confidential & Compassionate',
      subTitle:
          'We respect your privacy and offer support with care and empathy.',
      imageUrl: 'assets/images/support.png',
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
      subTitleTextStyle: TextStyle(
        fontSize: 16,
        overflow: TextOverflow.visible,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroScreenOnboarding(
        introductionList: list,
        onTapSkipButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UserDetailsScreen()),
          );
        },
        skipTextStyle: TextStyle(color: Colors.teal),
        backgroudColor: Colors.white,
      ),
    );
  }
}
