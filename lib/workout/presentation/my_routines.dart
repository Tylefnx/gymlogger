import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:gymlogger/workout/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyRoutines extends HookConsumerWidget {
  const MyRoutines({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routines = ref.watch(workoutStateNotifierProvider);
    final authState = ref.watch(authStateNotifierProvider);
    useEffect(
      () {
        Future(() {
          authState.maybeMap(
            orElse: () {},
            authenticated: (_) => ref
                .read(workoutStateNotifierProvider.notifier)
                .getWorkoutRoutine(
                  username: _.user.username,
                  token: _.user.token,
                ),
          );
        });
        return null;
      },
      [authState],
    );
    return routines.map(
      loading: (_) => const CircularProgressIndicator(),
      failed: (_) => AppText.big_bold(text: _.failure?.error ?? ''),
      loaded: (_) => ListView.builder(
        itemCount: _.liftLogs.routines.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoutineCard(
                label: _.liftLogs.routines[index].routineName,
              ),
            ],
          );
        },
      ),
    );
  }
}

class RoutineCard extends StatelessWidget {
  final String label;
  const RoutineCard({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => context.pushRoute(
        RoutineDetailsRoute(
          routineName: label,
        ),
      ),
      child: Card(
        child: AppPadding.h10v20(
          child: AppText.bold(text: label),
        ),
      ),
    );
  }
}
