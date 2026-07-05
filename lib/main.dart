import 'package:due_guard/features/on_boarding/presentaion/home_screen.dart';
import 'package:due_guard/features/on_boarding/presentaion/on_boarding.dart';
import 'package:due_guard/features/on_boarding/presentaion/widget/on_boarding_badge.dart';
import 'package:flutter/material.dart';

import 'features/on_boarding/presentaion/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(
        slides: [
          OnboardingSlideData(
            illustration: onboardingIllustrationSlide1,
            title: 'Never miss\na payment again',
            description:
            'Keep all your manual bills, rent, and credit cards organized in one calm place without connecting a bank account.',
          ),
          OnboardingSlideData(
            illustration: onboardingIllustrationSlide2,
            title: 'Know exactly\nwhat you owe',
            description:
            'DueGuard calculates interest, minimum due, and late fees automatically — no guesswork.',
          ),
          OnboardingSlideData(
            illustration: onboardingIllustrationSlide3,
            title: 'Stay ahead,\nstress-free',
            description:
            'Gentle reminders before due dates, so nothing sneaks up on you.',
          ),
        ],
        onFinished: () {
          // Navigate to the home screen or another screen after onboarding
        },
      ),
    );
  }
}