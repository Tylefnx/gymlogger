import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_items.dart';

class CustomBottomNavigationBar extends HookWidget {
  final ValueNotifier<int> selectedIndex;
  const CustomBottomNavigationBar({
    required this.selectedIndex,
    super.key,
  });
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex.value,
      fixedColor: Colors.blueAccent,
      elevation: 50,
      items: bottomNavigationItems,
      onTap: (_) {
        selectedIndex.value = _;
      },
    );
  }
}
