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
    final scrollController = useScrollController();
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
        actions: [
          IconButton(
            onPressed: _addMovement(textEditingControllers, scrollController),
            icon: const Icon(Icons.add),
          ),
        ],
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
            MovementBlockBuilder(
              scrollController: scrollController,
              textEditingControllers: textEditingControllers,
            ),
            AppButton(
              onPressed: () {
                for (final ctList in textEditingControllers.value) {
                  for (final b in ctList) {
                    if (b.text.isEmpty) {
                      continue;
                    }
                  }
                }

                authState.maybeMap(
                  authenticated: (auth) {
                    final username = auth.user.username;
                    final token = auth.user.token;

                    final Map<String, List<int>> exercises = {
                      for (final ctList in textEditingControllers.value)
                        ctList[0].text: [
                          int.parse(ctList[1].text), // weight
                          int.parse(ctList[2].text), // sets
                          int.parse(ctList[3].text) // reps
                        ]
                    };

                    final routine = Routine(
                      routineName: routineController.text,
                      exercises: exercises,
                    );

                    ref
                        .read(workoutStateNotifierProvider.notifier)
                        .saveWorkoutRoutine(
                          username: username,
                          routineName: routine.routineName,
                          token: token,
                          exercises: exercises,
                        );
                  },
                  orElse: () {},
                );
                context.maybePop();
              },
              title: 'Add Routine',
            ),
          ],
        ),
      ),
    );
  }
}

class MovementBlockBuilder extends StatelessWidget {
  const MovementBlockBuilder({
    super.key,
    required this.scrollController,
    required this.textEditingControllers,
  });

  final ScrollController scrollController;
  final ValueNotifier<List<List<TextEditingController>>> textEditingControllers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: textEditingControllers.value.length,
        itemBuilder: (BuildContext context, int index) {
          return AddMovementBlock(
            textEditingControllers: textEditingControllers,
            index: index,
          );
        },
      ),
    );
  }
}

class AddMovementBlock extends StatelessWidget {
  const AddMovementBlock({
    super.key,
    required this.textEditingControllers,
    required this.index,
  });

  final ValueNotifier<List<List<TextEditingController>>> textEditingControllers;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText.big_bold(text: 'Movement ${index + 1}'),
        SBAppPadding.h10(),
        AppTextFormField.name(
          label: 'Movement Name',
          controller: textEditingControllers.value[index][0],
        ),
        SBAppPadding.h10(),
        AppTextFormField.numberWithOptions(
          label: 'Weight',
          controller: textEditingControllers.value[index][1],
        ),
        SBAppPadding.h10(),
        Row(
          children: [
            Expanded(
              child: AppTextFormField.numberWithOptions(
                label: 'Sets',
                controller: textEditingControllers.value[index][2],
              ),
            ),
            SBAppPadding.w15(),
            Expanded(
              child: AppTextFormField.numberWithOptions(
                label: 'Reps',
                controller: textEditingControllers.value[index][3],
              ),
            ),
          ],
        ),
        SBAppPadding.h30(),
      ],
    );
  }
}

void Function() _addMovement(
  ValueNotifier<List<List<TextEditingController>>> textEditingControllers,
  ScrollController scrollController,
) {
  return () {
    textEditingControllers.value.add(
      [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ],
    );
    textEditingControllers.value = List.from(textEditingControllers.value);
    scrollController.position.jumpTo(
      scrollController.position.maxScrollExtent * 3,
    );
  };
}
