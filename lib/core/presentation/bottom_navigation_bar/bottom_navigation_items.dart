import 'package:flutter/material.dart';

final bottomNavigationItems = [
  BottomNavigationBarItem(
    label: bottomNavigationLabels[1],
    icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    label: bottomNavigationLabels[1],
    icon: Icon(Icons.calendar_view_day),
  ),
  BottomNavigationBarItem(
    label: bottomNavigationLabels[2],
    icon: Icon(Icons.person),
  ),
];

const List<String?> bottomNavigationLabels = ['Home', 'Program', 'Profile'];
