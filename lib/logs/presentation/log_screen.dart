import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_gridview.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGridviewWidget(children: [
      GridviewSectionCard(
        label: 'Squat',
        icon: Icons.fitness_center,
        onTap: () {},
      ),
      GridviewSectionCard(
        label: 'Bench',
        icon: Icons.fitness_center,
        onTap: () {},
      ),
      GridviewSectionCard(
        label: 'Deadlift',
        icon: Icons.fitness_center,
        onTap: () {},
      ),
      GridviewSectionCard(
        label: 'Overhead Press',
        icon: Icons.fitness_center,
        onTap: () {},
      ),
    ]);
  }
}
