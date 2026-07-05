import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/shared/widget/app_button.dart';
import '../../../../core/shared/widget/screen_padding.dart';
import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/theme/app_texts.dart';
import '../../../on_boarding/presentaion/on_boarding.dart';
import '../../../on_boarding/presentaion/widget/on_boarding_badge.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                        centerIcon: Icons.person_add_alt_1,
                        badges: [],
                      ),
                      const SizedBox(height: AppDimensions.spacingXL),
                      Text(
                        AppTexts.registerTitle,
                        style: AppTextStyle.headerText,
                      ),
                      const SizedBox(height: AppDimensions.spacingM),
                      Text(
                        AppTexts.registerSubTitle,
                        style: AppTextStyle.descriptionText,
                      ),
                      const Spacer(),
                      AppButton(
                          label: "Signup with google",
                          iconPath: AppAssets.googleIcon,
                          onPressed: (){}
                      ),
                      AppButton(
                          label: "Signup with Apple",
                          iconPath: AppAssets.appleIcon,
                          bgColor: AppColors.textPrimary,
                          textColor: AppColors.background,
                          onPressed: (){}
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go(AppRoutes.login);
                        },
                        child: Text(
                          "Already have an account? Login",
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
