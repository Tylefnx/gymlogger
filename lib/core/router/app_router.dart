import 'package:go_router/go_router.dart';
import 'package:gymlogger/calculator/presentation/1rm_calculator.dart';
import 'package:gymlogger/calculator/presentation/strength_level.dart';
import 'package:gymlogger/main_page/main_page.dart';

class AppRoute {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        name: "home_page",
        path: "/",
        builder: (context, state) {
          return const MainPage();
        },
      ),
      GoRoute(
        path: "/calculators/1RM",
        builder: (context, state) {
          return const OneRepMaxCalculator();
        },
      ),
      GoRoute(
        path: "/calculators/str_level",
        builder: (context, state) {
          return const StrengthLevelCalculator();
        },
      ),
    ],
  );
}
