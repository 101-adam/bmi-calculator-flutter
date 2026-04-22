import 'package:flutter/material.dart';
import 'registration_screen.dart';

void main() {
  runApp(const RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FD),
        primaryColor: const Color(0xFF7B61FF),
        fontFamily: 'Roboto', 
      ),
      home: const RegistrationScreen(),
    );
  }
}