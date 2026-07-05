import 'package:due_guard/core/shared/widget/app_button.dart';
import 'package:due_guard/core/shared/widget/screen_padding.dart';
import 'package:due_guard/core/theme/app_colors.dart';
import 'package:due_guard/core/theme/app_text_style.dart';
import 'package:due_guard/core/theme/app_texts.dart';
import 'package:due_guard/features/on_boarding/presentaion/widget/primary_badge.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../on_boarding/presentaion/on_boarding.dart';
import '../../../on_boarding/presentaion/widget/on_boarding_badge.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned.fill(child: OnboardingOrbitingRingsBackground()),
          SafeArea(
            child: ScreenPadding(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OnboardingIllustration(
                        centerIcon: Icons.lock_open,
                        badges: [],
                      ),
                      const SizedBox(height: AppDimensions.spacingXL),
                      Text(
                        AppTexts.loginWelcome,
                        style: AppTextStyle.headerText,
                      ),
                      const SizedBox(height: AppDimensions.spacingM),
                      Text(
                        AppTexts.loginSubTitle,
                        style: AppTextStyle.descriptionText,
                      ),
                      const Spacer(),
                      AppButton(
                          label: "Continue with google",
                          iconPath: AppAssets.googleIcon,
                          onPressed: (){}
                      ),
                      AppButton(
                          label: "Continue with Apple",
                          iconPath: AppAssets.appleIcon,
                          bgColor: AppColors.textPrimary,
                          textColor: AppColors.background,
                          onPressed: (){}
                      ),
                    GestureDetector(
                      onTap: () {
                        context.go(AppRoutes.register);
                      },
                      child: Text(
                        "Don't have an account? Register",
                        style: AppTextStyle.linkTextStyle,
                      ),
                    ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                              Icons.verified_user,
                              color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: AppDimensions.spacingS),
                          Text(
                            AppTexts.footerText.toUpperCase(),
                            style: AppTextStyle.footerTextStyle,
                          )
                        ],
                      ),

                  ],
                ),
              )
              ),
            ),
        ],
      ),
    );
  }
}