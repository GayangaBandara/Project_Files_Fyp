import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/onboarding/user_details_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeSpace',
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      routes: {
        "/details": (context) => const UserDetailsScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}