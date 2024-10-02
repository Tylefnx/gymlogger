import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomBottomNavigationBar extends HookConsumerWidget {
  final ValueNotifier<int> selectedIndex;
  const CustomBottomNavigationBar({
    required this.selectedIndex,
    super.key,
  });
  Widget build(BuildContext context, WidgetRef ref) {
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
