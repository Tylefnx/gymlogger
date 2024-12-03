import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymlogger/authentication/presentation/login_screen.dart';
import 'package:gymlogger/authentication/presentation/register_screen.dart';
import 'package:gymlogger/calculator/presentation/1rm_calculator.dart';
import 'package:gymlogger/calculator/presentation/calculator_screen.dart';
import 'package:gymlogger/calculator/presentation/strength_level.dart';
import 'package:gymlogger/logs/presentation/add_lift.dart';
import 'package:gymlogger/logs/presentation/lift_log_screen.dart';
import 'package:gymlogger/logs/presentation/log_screen.dart';
import 'package:gymlogger/main_page/main_page.dart';
import 'package:gymlogger/main_page/sub_screens/profile_screen.dart';
import 'package:gymlogger/workout/presentation/create_workout_screen.dart';
import 'package:gymlogger/workout/presentation/workout_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Calculator,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/dashboard',
          page: MainRoute.page,
          children: [
            AutoRoute(
              path: 'workout',
              page: WorkoutRoute.page,
            ),
            AutoRoute(
              path: 'logs',
              page: LogRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
          initial: true,
        ),
      ];
}

// class AppRoute {
//   GoRouter router = GoRouter(
//     initialLocation: '/authentication/login',
//     routes: <GoRoute>[
//       GoRoute(
//         name: "login",
//         path: "/authentication/login",
//         builder: (context, state) {
//           return const LoginScreen();
//         },
//       ),
//       GoRoute(
//         name: "register",
//         path: "/authentication/register",
//         builder: (context, state) {
//           return const RegisterScreen();
//         },
//       ),
//       GoRoute(
//         name: "home_page",
//         path: "/home",
//         builder: (context, state) {
//           return const MainPage();
//         },
//       ),
//       GoRoute(
//         path: "/calculators/1RM",
//         builder: (context, state) {
//           return const OneRepMaxCalculator();
//         },
//       ),
//       GoRoute(
//         path: "/calculators/str_level",
//         builder: (context, state) {
//           return const StrengthLevelCalculator();
//         },
//       ),
//       GoRoute(
//         path: "/calculators/fat_percentage",
//         builder: (context, state) {
//           return const FatPercentageCalculator();
//         },
//       ),
//       GoRoute(
//         path: "/logs/squat",
//         builder: (context, state) {
//           return const LiftLogScreen(
//             lift: 'Squat',
//           );
//         },
//       ),
//       GoRoute(
//         path: "/logs/bench",
//         builder: (context, state) {
//           return const LiftLogScreen(
//             lift: 'Bench Press',
//           );
//         },
//       ),
//       GoRoute(
//         path: "/logs/deadlift",
//         builder: (context, state) {
//           return const LiftLogScreen(
//             lift: 'Deadlift',
//           );
//         },
//       ),
//       GoRoute(
//         path: "/logs/ohp",
//         builder: (context, state) {
//           return const LiftLogScreen(
//             lift: 'Overhead Press',
//           );
//         },
//       ),
//       GoRoute(
//         path: "/workout/:routineName",
//         builder: (context, state) {
//           final routineName = state.pathParameters['routineName']!;
//           return RoutineDetails(routineName: routineName);
//         },
//       ),
//     ],
//   );
// }
