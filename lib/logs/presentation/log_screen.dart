import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymlogger/core/presentation/app_gridview.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGridviewWidget(children: [
      GridviewSectionCard(
        label: 'Squat',
        icon: Icons.fitness_center,
        onTap: () => GoRouter.of(context).push('/logs/squat'),
      ),
      GridviewSectionCard(
        label: 'Bench Press',
        icon: Icons.fitness_center,
        onTap: () => GoRouter.of(context).push('/logs/bench'),
      ),
      GridviewSectionCard(
        label: 'Deadlift',
        icon: Icons.fitness_center,
        onTap: () => GoRouter.of(context).push('/logs/deadlift'),
      ),
      GridviewSectionCard(
        label: 'Overhead Press',
        icon: Icons.fitness_center,
        onTap: () => GoRouter.of(context).push('/logs/ohp'),
      ),
    ]);
  }
}
