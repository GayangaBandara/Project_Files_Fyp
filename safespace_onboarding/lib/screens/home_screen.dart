// TODO Implement this library.
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Text(
          'Safe Space',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade700,
            fontFamily: 'Arial Rounded',
          ),
        ),
      ),
    );
  }
}
