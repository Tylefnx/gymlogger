import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_gridview.dart';
import 'package:gymlogger/core/router/app_router.dart';

@RoutePage()
class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGridviewWidget(
      children: [
        GridviewSectionCard(
          label: 'Squat',
          iconPath: 'assets/icons/squat.png',
          onTap: () => AutoRouter.of(context).push(LiftLogRoute(lift: 'Squat')),
        ),
        GridviewSectionCard(
          label: 'Bench Press',
          iconPath: 'assets/icons/benchpress.png',
          onTap: () =>
              AutoRouter.of(context).push(LiftLogRoute(lift: 'Bench Press')),
        ),
        GridviewSectionCard(
          label: 'Deadlift',
          iconPath: 'assets/icons/deadlift.png',
          onTap: () =>
              AutoRouter.of(context).push(LiftLogRoute(lift: 'Deadlift')),
        ),
        GridviewSectionCard(
          label: 'Overhead Press',
          iconPath: 'assets/icons/ohp.png',
          onTap: () => AutoRouter.of(context).push(
            LiftLogRoute(lift: 'Overhead Press'),
          ),
        ),
      ],
    );
  }
}
