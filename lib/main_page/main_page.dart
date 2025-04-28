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
import 'package:toastification/toastification.dart';

final _appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ToastificationWrapper(
        child: MaterialApp.router(
          // theme: ThemeData.dark(),
          routerConfig: _appRouter.config(),
          title: 'Gymlogger',
        ),
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
    return authState.map(
      loading: (_) => const LoadingScreen(),
      unauthenticated: (_) => const LoginScreen(),
      authenticated: (_) => const DashboardScreen(),
    );
  }
}

@RoutePage()
class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavigationIndex = useState(0);
    final state = ref.watch(authStateNotifierProvider);
    final uid =
        state.maybeMap(authenticated: (_) => _.user.token, orElse: () {});
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => ref.read(authStateNotifierProvider.notifier).logout(
                token: uid!,
              ),
          icon: const Icon(Icons.logout),
        ),
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
