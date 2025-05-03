import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/presentation/login_screen.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/color_scemes/color_schemes_state.dart';
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
    return const ProviderScope(
      child: ToastificationWrapper(
        child: AppMaterialApp(),
      ),
    );
  }
}

class AppMaterialApp extends ConsumerWidget {
  const AppMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(colorSchemeStateNotifierProvider);
    return MaterialApp.router(
      theme: themeState.themeData,
      routerConfig: _appRouter.config(),
      title: 'Gymlogger',
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
    final title = bottomNavigationLabels[bottomNavigationIndex.value]!;
    return Scaffold(
      appBar: AppBar(
        actions: title == 'Profile'
            ? [
                IconButton(
                  onPressed: () => AutoRouter.of(context).push(
                    const UpdateUserRoute(),
                  ),
                  icon: const Icon(
                    Icons.edit,
                    size: 18,
                  ),
                ),
              ]
            : null,
        title: AppText.big_bold(
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
