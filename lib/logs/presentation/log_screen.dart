import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_gridview.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:gymlogger/logs/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LogScreen extends HookConsumerWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.read(authStateNotifierProvider);
    final username = authState.maybeMap(
      orElse: () => '',
      authenticated: (_) => _.user.username,
    );
    useEffect(
      () {
        Future(() {
          ref
              .read(movementsStateNotifierProvider.notifier)
              .getUserLifts(username: username);
        });
        return null;
      },
      [],
    );
    return AppGridviewWidget(
      children: [
        GridviewSectionCard(
          label: 'Squat',
          iconPath: 'assets/icons/squat.png',
          onTap: () => AutoRouter.of(context).push(
            LiftLogRoute(lift: 'Squat'),
          ),
        ),
        GridviewSectionCard(
          label: 'Bench Press',
          iconPath: 'assets/icons/benchpress.png',
          onTap: () => AutoRouter.of(context).push(
            LiftLogRoute(lift: 'Bench Press'),
          ),
        ),
        GridviewSectionCard(
          label: 'Deadlift',
          iconPath: 'assets/icons/deadlift.png',
          onTap: () => AutoRouter.of(context).push(
            LiftLogRoute(lift: 'Deadlift'),
          ),
        ),
        GridviewSectionCard(
          label: 'Overhead Press',
          iconPath: 'assets/icons/ohp.png',
          onTap: () => AutoRouter.of(context).push(
            LiftLogRoute(lift: 'Overhead Press'),
          ),
        ),
      ],
    );
  }
}
