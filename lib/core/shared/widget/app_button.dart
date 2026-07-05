import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String? iconPath;
  final Color bgColor;
  final Color textColor;
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.iconPath,
    this.bgColor = AppColors.background,
    this.textColor = AppColors.textPrimary
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: textColor,
            side: const BorderSide(color: AppColors.border),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
            ),
          ),
          child: iconPath == null
              ? Text(
            label,
            style: AppTextStyle.primaryButtonTextStyle.copyWith(color: textColor),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath!,
                width: 30,
                height: 30,
              ),
              const SizedBox(width: AppDimensions.spacingM),
              Text(
                label,
                style: AppTextStyle.primaryButtonTextStyle.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
