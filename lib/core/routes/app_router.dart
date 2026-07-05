import 'package:go_router/go_router.dart';

import '../../features/on_boarding/presentaion/on_boarding.dart';
class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const OnboardingAnimatedBackground(),
      ),
    ],
  );


}