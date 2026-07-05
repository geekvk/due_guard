import 'package:flutter/cupertino.dart';

import '../../theme/app_dimensions.dart';

class ScreenPadding extends StatelessWidget {
  const ScreenPadding({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.screenPaddingHorizontal,
          vertical: AppDimensions.screenPaddingVertical
      ),
      child: child,
    );
  }
}