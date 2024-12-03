import 'package:flutter/material.dart';
import 'package:gymlogger/calculator/presentation/calculator_screen.dart';
import 'package:gymlogger/logs/presentation/log_screen.dart';
import 'package:gymlogger/main_page/sub_screens/profile_screen.dart';
import 'package:gymlogger/workout/presentation/workout_screen.dart';

final bottomNavigationItems = [
  BottomNavigationBarItem(
    label: bottomNavigationLabels[0],
    icon: const Icon(Icons.fitness_center),
  ),
  BottomNavigationBarItem(
    label: bottomNavigationLabels[1],
    icon: const Icon(Icons.query_stats_sharp),
  ),
  BottomNavigationBarItem(
    label: bottomNavigationLabels[2],
    icon: const Icon(Icons.calculate),
  ),
  BottomNavigationBarItem(
    label: bottomNavigationLabels[3],
    icon: const Icon(Icons.person),
  ),
];

const List<String?> bottomNavigationLabels = [
  'Workout',
  'Logs',
  'Calculators',
  'Profile',
];

const mainScreens = <Widget>[
  WorkoutScreen(),
  LogScreen(),
  CalculatorsScreen(),
  ProfileScreen(),
];
