import 'package:due_guard/features/on_boarding/presentaion/widget/on_boarding_badge.dart';
import 'package:flutter/material.dart';

import 'on_boarding.dart';

/// Content for a single onboarding slide. The background animation is
/// shared/persistent across all slides — only this content swaps.
class OnboardingSlideData {
  const OnboardingSlideData({
    required this.illustration,
    required this.title,
    required this.description,
  });

  /// The badge/icon illustration shown above the title (e.g. the
  /// card-with-status-badges graphic in the reference screenshot).
  /// Pass any widget — an Icon, an Image, a custom composed widget, etc.
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

  /// Called when the user taps Continue on the final slide, or taps Skip.
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
                                    style: const TextStyle(
                                      color: Color(0xFFF5F5F5),
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    slide.description,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFFB8B8B8),
                                      fontSize: 16,
                                      height: 1.5,
                                    ),
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
                              ? const Color(0xFFF5F5F5)
                              : const Color(0xFFF5F5F5).withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      );
                    }),
                  ),
                ),

                // Continue button — label changes on the final slide.
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _handleContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A0A0A),
                        foregroundColor: const Color(0xFFF5F5F5),
                        side: const BorderSide(color: Color(0xFF2A2A2A)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        _isLastPage ? 'Get started' : 'Continue',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Example wiring — replace illustrations with your real badge/icon
/// composition per slide.
final exampleOnboardingSlides = [
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
];