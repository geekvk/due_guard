import 'package:due_guard/core/theme/app_text_style.dart';
import 'package:due_guard/features/on_boarding/presentaion/widget/on_boarding_badge.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/widget/primary_button.dart';
import '../../../core/theme/app_colors.dart';
import 'on_boarding.dart';

class OnboardingSlideData {
  const OnboardingSlideData({
    required this.illustration,
    required this.title,
    required this.description,
  });

  final Widget illustration;
  final String title;
  final String description;
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
    required this.slides,
    required this.onFinished,
  });

  final List<OnboardingSlideData> slides;
  final VoidCallback onFinished;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  bool get _isLastPage => _currentPage == widget.slides.length - 1;

  void _handleContinue() {
    if (_isLastPage) {
      widget.onFinished();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Stack(
        children: [
          // Persistent animated background — does not rebuild per slide.
          const Positioned.fill(child: OnboardingOrbitingRingsBackground()),

          SafeArea(
            child: Column(
              children: [
                // Skip button — top-right, low emphasis, always visible.
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24, top: 8),
                    child: TextButton(
                      onPressed: widget.onFinished,
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Color(0xFFB8B8B8), fontSize: 13),
                      ),
                    ),
                  ),
                ),

                // Dynamic per-slide content: illustration, title, description.
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.slides.length,
                    onPageChanged: (index) => setState(() => _currentPage = index),
                    itemBuilder: (context, index) {
                      final slide = widget.slides[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const SizedBox(height: 32),
                            slide.illustration,
                            const SizedBox(height: 24),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    slide.title,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.headerText
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    slide.description,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.descriptionText
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Page dots — reflect _currentPage, sit above the button.
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.slides.length, (index) {
                      final isActive = index == _currentPage;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: isActive ? 20 : 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.textPrimary
                              : AppColors.textPrimary.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      );
                    }),
                  ),
                ),
                PrimaryButton(
                    buttonLabel: _isLastPage ? 'Get started' : 'Continue',
                    onPressed: _handleContinue
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}