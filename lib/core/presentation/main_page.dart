import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavigationIndex = useState(0);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(bottomNavigationLabels[bottomNavigationIndex.value]!),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: bottomNavigationIndex,
        ),
        body: AppPadding.h10v20(
          child: Column(
            children: [
              AppText.bold(text: 'Quick Start'),
            ],
          ),
        ),
      ),
    );
  }
}
