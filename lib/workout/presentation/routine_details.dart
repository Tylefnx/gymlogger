import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final routineState = ref.read(workoutStateNotifierProvider);
    final routine = routineState.maybeMap(
      orElse: () =>
          const Routine(routineName: 'An error occurred', exercises: {}),
      loaded: (_) =>
          _.liftLogs.routines.where((e) => e.routineName == routineName).first,
    );

    final completedExercises = ValueNotifier<List<bool>>(
      List.filled(routine.exercises.length, false),
    );

    return Scaffold(
      appBar: AppBar(title: Text(routineName)),
      body: routineState.maybeMap(
        orElse: () => const SizedBox(),
        loaded: (_) => Column(
          children: [
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
                4: FlexColumnWidth(),
              },
              border: TableBorder.all(color: colorScheme.primary),
              children: [
                TableRow(
                  decoration:
                      BoxDecoration(color: colorScheme.primaryContainer),
                  children: const [
                    TableColumn(
                      label: 'Exercise',
                    ),
                    TableColumn(
                      label: 'Sets',
                    ),
                    TableColumn(
                      label: 'Reps',
                    ),
                    TableColumn(
                      label: 'Weight',
                    ),
                    TableColumn(
                      label: 'Done',
                    ),
                  ],
                ),
                ...List.generate(routine.exercises.length, (index) {
                  final keys = routine.exercises.keys.toList();
                  final values = routine.exercises.values.toList();
                  return TableRow(
                    children: [
                      TableColumn(label: keys[index]),
                      TableColumn(label: values[index][1].toString()),
                      TableColumn(label: values[index][2].toString()),
                      TableColumn(label: values[index][0].toString()),
                      ValueListenableBuilder(
                        valueListenable: completedExercises,
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value[index],
                            onChanged: (bool? newValue) {
                              if (newValue != null) {
                                value[index] = newValue;
                                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                completedExercises.notifyListeners();
                              }
                            },
                          );
                        },
                      ),
                    ],
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TableColumn extends StatelessWidget {
  const TableColumn({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
