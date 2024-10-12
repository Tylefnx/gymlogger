import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_items.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends HookConsumerWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavigationIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText.bold(
          text: bottomNavigationLabels[bottomNavigationIndex.value]!,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: bottomNavigationIndex,
      ),
      body: WorkoutScreen(),
    );
  }
}

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppPadding.h10v20(
        child: Column(
          children: [
            AppText.big_bold(text: 'Quick Start'),
            SB_AppPadding.h10(),
            AppAddButton(
              text: 'Start Empty Workout',
            ),
            SB_AppPadding.h10(),
            AppText.big_bold(text: 'Routines'),
            SB_AppPadding.h10(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppTallButton(
                    text: 'New Routine',
                    icondata: Icons.bookmark_add,
                  ),
                ),
                SB_AppPadding.w15(),
                Expanded(
                  child: AppTallButton(
                    text: 'Explore',
                    icondata: Icons.search,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
