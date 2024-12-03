import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/presentation/login_screen.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:gymlogger/core/presentation/bottom_navigation_bar/bottom_navigation_items.dart';
import 'package:gymlogger/core/presentation/loading_screen.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Gymlogger',
      ),
    );
  }
}

@RoutePage()
class MainScreen extends HookConsumerWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);
    return authState.when(
      loading: () => const LoadingScreen(),
      unauthenticated: (_) => const LoginScreen(),
      authenticated: (_, __) => const DashboardScreen(),
    );
  }
}

class DashboardScreen extends HookWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
