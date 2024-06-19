// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:onboarding/pages/onboarding_pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingFourthPage(),
    );
  }
}

