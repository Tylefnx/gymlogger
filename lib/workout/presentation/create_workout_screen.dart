import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:gymlogger/workout/domain/routine.dart';
import 'package:gymlogger/workout/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CreateRoutineScreen extends HookConsumerWidget {
  const CreateRoutineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);
    final routineController = useTextEditingController();
    final textEditingControllers = useState<List<List<TextEditingController>>>(
      [
        [
          TextEditingController(),
          TextEditingController(),
          TextEditingController(),
          TextEditingController(),
        ],
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: 'Create Routine'),
      ),
      body: AppPadding.h30v40(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextFormField.name(
              label: 'Routine Name',
              controller: routineController,
            ),
            SBAppPadding.h10(),
            Expanded(
              child: ListView.builder(
                itemCount: textEditingControllers.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      AppText.big_bold(text: 'Movement ${index + 1}'),
                      SBAppPadding.h10(),
                      AppTextFormField.name(
                        label: 'Movement Name',
                        controller: textEditingControllers.value[index][0],
                      ),
                      SBAppPadding.h10(),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextFormField.numberWithOptions(
                              label: 'Weight',
                              controller: textEditingControllers.value[index]
                                  [1],
                            ),
                          ),
                          SBAppPadding.w15(),
                          Expanded(
                            child: AppTextFormField.numberWithOptions(
                              label: 'Sets',
                              controller: textEditingControllers.value[index]
                                  [2],
                            ),
                          ),
                          SBAppPadding.w15(),
                          Expanded(
                            child: AppTextFormField.numberWithOptions(
                              label: 'Reps',
                              controller: textEditingControllers.value[index]
                                  [3],
                            ),
                          ),
                        ],
                      ),
                      SBAppPadding.h30(),
                    ],
                  );
                },
              ),
            ),
            AppButton(
              onPressed: () {
                for (final ctList in textEditingControllers.value) {
                  for (final b in ctList) {
                    if (b.text == '') {
                      continue;
                    }
                  }
                }
                authState.maybeMap(
                  orElse: () {},
                  authenticated: (_) {
                    final username = _.user.username;
                    final token = _.user.token;
                    var exercises = <String, List<int>>{};
                    for (final ctList in textEditingControllers.value) {
                      final exerciseName = ctList[0].text;
                      final weight = int.parse(ctList[1].text);
                      final sets = int.parse(ctList[2].text);
                      final reps = int.parse(ctList[3].text);
                      exercises.addEntries(
                        [
                          MapEntry(exerciseName, [weight, sets, reps])
                        ],
                      );
                    }
                    final routine = Routine(
                      routineName: routineController.text,
                      exercises: exercises,
                    );
                    print(routine);
                    ref
                        .read(workoutStateNotifierProvider.notifier)
                        .saveWorkoutRoutine(
                          username: username,
                          routineName: routine.routineName,
                          token: token,
                          exercises: exercises,
                        );
                  },
                );
                context.maybePop(); // TODO: MAYBEPOP?
              },
              title: 'Add Routine',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final tempList = List<List<TextEditingController>>.from(
            textEditingControllers.value,
          );
          tempList.add(
            [
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
            ],
          );
          textEditingControllers.value = tempList;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
