import 'package:due_guard/core/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.appRouter,
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
