import 'package:due_guard/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/on_boarding/presentaion/on_boarding.dart';
import '../../features/on_boarding/presentaion/on_boarding_screen.dart';
import '../../features/on_boarding/presentaion/onboarding_page.dart';
import 'app_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _historyNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'history');
final _insightsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'insights');
final _settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );


}