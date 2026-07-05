import 'package:due_guard/features/on_boarding/presentaion/widget/on_boarding_badge.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_texts.dart';
import 'on_boarding_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static final List<OnboardingSlideData> _slides = [
    OnboardingSlideData(
      illustration: onboardingIllustrationSlide1,
      title: AppTexts.onboarding1Text,
      description: AppTexts.onboarding1SubTitle,
    ),
    OnboardingSlideData(
      illustration: onboardingIllustrationSlide2,
      title: AppTexts.onboarding2SubTitle,
      description : AppTexts.onboarding2SubTitle
    ),
    OnboardingSlideData(
      illustration: onboardingIllustrationSlide3,
      title: AppTexts.onboarding3Text,
      description: AppTexts.onboarding3SubTitle
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      slides: _slides,
      onFinished: () => context.go(AppRoutes.login),
    );
  }
}