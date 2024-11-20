import 'package:go_router/go_router.dart';
import 'package:gymlogger/authentication/presentation/login_screen.dart';
import 'package:gymlogger/calculator/presentation/1rm_calculator.dart';
import 'package:gymlogger/calculator/presentation/fat_percentage_calculator.dart';
import 'package:gymlogger/calculator/presentation/strength_level.dart';
import 'package:gymlogger/logs/presentation/add_lift.dart';
import 'package:gymlogger/logs/presentation/lift_log_screen.dart';
import 'package:gymlogger/main_page/main_page.dart';

class AppRoute {
  GoRouter router = GoRouter(
    initialLocation: '/authentication',
    routes: <GoRoute>[
      GoRoute(
        name: "authenctication",
        path: "/authentication",
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: "home_page",
        path: "/home",
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
      GoRoute(
        path: "/calculators/fat_percentage",
        builder: (context, state) {
          return const FatPercentageCalculator();
        },
      ),
      GoRoute(
        path: "/logs/squat",
        builder: (context, state) {
          return const LiftLogScreen(
            lift: 'Squat',
          );
        },
      ),
      GoRoute(
        path: "/logs/bench",
        builder: (context, state) {
          return const LiftLogScreen(
            lift: 'Bench Press',
          );
        },
      ),
      GoRoute(
        path: "/logs/deadlift",
        builder: (context, state) {
          return const LiftLogScreen(
            lift: 'Deadlift',
          );
        },
      ),
      GoRoute(
        path: "/logs/ohp",
        builder: (context, state) {
          return const LiftLogScreen(
            lift: 'Overhead Press',
          );
        },
      ),
    ],
  );
}
