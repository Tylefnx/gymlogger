import 'package:flutter/material.dart';

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
