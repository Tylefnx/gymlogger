import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymlogger/authentication/presentation/login_screen.dart';
import 'package:gymlogger/authentication/presentation/register_screen.dart';
import 'package:gymlogger/calculator/presentation/1rm_calculator.dart';
import 'package:gymlogger/calculator/presentation/calculator_screen.dart';
import 'package:gymlogger/calculator/presentation/fat_percentage_calculator.dart';
import 'package:gymlogger/calculator/presentation/strength_level.dart';
import 'package:gymlogger/logs/presentation/add_lift.dart';
import 'package:gymlogger/logs/presentation/lift_log_screen.dart';
import 'package:gymlogger/logs/presentation/log_screen.dart';
import 'package:gymlogger/main_page/main_page.dart';
import 'package:gymlogger/main_page/sub_screens/profile_screen.dart';
import 'package:gymlogger/workout/presentation/create_workout_screen.dart';
import 'package:gymlogger/workout/presentation/routine_details.dart';
import 'package:gymlogger/workout/presentation/workout_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Calculator,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: MainRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: '/register',
          page: RegisterRoute.page,
        ),
        AutoRoute(
          path: '/lift_logs',
          page: LiftLogRoute.page,
        ),
        AutoRoute(
          path: '/createroutine',
          page: CreateRoutineRoute.page,
        ),
        AutoRoute(
          path: '/dashboard',
          page: DashboardRoute.page,
        ),
        AutoRoute(
          path: '/workout',
          page: WorkoutRoute.page,
        ),
        AutoRoute(
          path: '/logs',
          page: LogRoute.page,
        ),
        AutoRoute(
          path: '/onerepmaxcalc',
          page: OneRepMaxRoute.page,
        ),
        AutoRoute(
          path: '/strengthlevelcalc',
          page: StrengthLevelRoute.page,
        ),
        // AutoRoute(
        //   path: '/routine',
        //   page: RoutineDetailsPage.page,
        // ),
        AutoRoute(
          path: '/fatpercentagecalc',
          page: FatPercentageRoute.page,
        ),
      ];
}
