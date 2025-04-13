import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/workout/domain/routine.dart';
import 'package:gymlogger/workout/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage(name: 'RoutineDetailsRoute')
class RoutineDetailsPage extends HookConsumerWidget {
  final String routineName;
  const RoutineDetailsPage({
    super.key,
    @PathParam('routineName') required this.routineName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineState = ref.read(workoutStateNotifierProvider);
    final routine = routineState.maybeMap(
      orElse: () =>
          const Routine(routineName: 'An error occured', exercises: {}),
      loaded: (_) => _.liftLogs.routines
          .where(
            (e) => e.routineName == routineName,
          )
          .first,
    );
    return Scaffold(
      appBar: AppBar(),
      body: AppPadding.h30v40(
        child: routineState.maybeMap(
          orElse: () => const SizedBox(),
          loaded: (_) => ListView.builder(
            itemCount: routine.exercises.length,
            itemBuilder: (BuildContext context, int index) {
              final keys = routine.exercises.keys.toList();
              final values = routine.exercises.values.toList();
              return AppText.big_bold(
                text:
                    '${keys[index]}: Sets: ${values[index][1]} Reps: ${values[index][2]} Weight: ${values[index][0]}',
              );
            },
          ),
        ),
      ),
    );
  }
}
