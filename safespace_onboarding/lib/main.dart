// main.dart
import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/home_screen.dart';


void main() => runApp(SafeSpaceApp());

class SafeSpaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SafeSpace',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: OnboardingScreen(),
      routes: {
        "/home": (context) => HomeScreen(),
      },
    );
  }
}
