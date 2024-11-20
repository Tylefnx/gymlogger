import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_items.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRoute();
    return ProviderScope(
      child: MaterialApp.router(
        builder: FlutterSmartDialog.init(),
        routerDelegate: _appRouter.router.routerDelegate,
        routeInformationParser: _appRouter.router.routeInformationParser,
        routeInformationProvider: _appRouter.router.routeInformationProvider,
        title: 'Gymlogger',
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
      body: mainScreens[bottomNavigationIndex.value],
    );
  }
}
