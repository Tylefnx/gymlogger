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
    final colorScheme = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      unselectedItemColor: Colors.white38,
      fixedColor: colorScheme.onPrimary,
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme.primary,
      currentIndex: selectedIndex.value,
      elevation: 5,
      items: bottomNavigationItems,
      onTap: (_) {
        selectedIndex.value = _;
      },
    );
  }
}
