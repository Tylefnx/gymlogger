import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_items.dart';

class CustomBottomNavigationBar extends HookWidget {
  final ValueNotifier<int> selectedIndex;
  const CustomBottomNavigationBar({
    required this.selectedIndex,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
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
