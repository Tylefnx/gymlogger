import 'package:flutter/material.dart';
import 'package:gymlogger/main_page/sub_screens/profile_screen.dart';
import 'package:gymlogger/main_page/sub_screens/workout_screen.dart';

final bottomNavigationItems = [
  BottomNavigationBarItem(
    label: bottomNavigationLabels[0],
    icon: Icon(Icons.fitness_center),
  ),
  BottomNavigationBarItem(
    label: bottomNavigationLabels[1],
    icon: Icon(Icons.person),
  ),
];

const List<String?> bottomNavigationLabels = ['Workout', 'Profile'];

const mainScreens = <Widget>[WorkoutScreen(), ProfileScreen()];
