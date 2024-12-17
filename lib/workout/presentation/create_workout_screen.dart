import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';

@RoutePage()
class CreateRoutineScreen extends HookWidget {
  final ValueNotifier<Map<String, Map<String, List<int>>>> routineList;
  const CreateRoutineScreen({super.key, required this.routineList});

  @override
  Widget build(BuildContext context) {
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
            SB_AppPadding.h10(),
            Expanded(
              child: ListView.builder(
                itemCount: textEditingControllers.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      AppText.big_bold(text: 'Movement ${index + 1}'),
                      SB_AppPadding.h10(),
                      AppTextFormField.name(
                        label: 'Movement Name',
                        controller: textEditingControllers.value[index][0],
                      ),
                      SB_AppPadding.h10(),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextFormField.numberWithOptions(
                              label: 'Weight',
                              controller: textEditingControllers.value[index]
                                  [1],
                            ),
                          ),
                          SB_AppPadding.w15(),
                          Expanded(
                            child: AppTextFormField.numberWithOptions(
                              label: 'Sets',
                              controller: textEditingControllers.value[index]
                                  [2],
                            ),
                          ),
                          SB_AppPadding.w15(),
                          Expanded(
                            child: AppTextFormField.numberWithOptions(
                              label: 'Reps',
                              controller: textEditingControllers.value[index]
                                  [3],
                            ),
                          ),
                        ],
                      ),
                      SB_AppPadding.h30(),
                    ],
                  );
                },
              ),
            ),
            AppButton(
              onPressed: () {
                for (var ctList in textEditingControllers.value) {
                  ctList.forEach(
                    (b) {
                      if (b.text == '') {
                        return;
                      }
                    },
                  );
                }
                final Map<String, List<int>> movementsList = {};
                for (var ctList in textEditingControllers.value) {
                  final movementEntry = MapEntry(ctList[0].text, [
                    int.parse(ctList[1].text),
                    int.parse(ctList[2].text),
                    int.parse(ctList[3].text),
                  ]);
                  movementsList.addEntries([movementEntry]);
                }
                final routinesTemp = routineList.value;
                final routineEntry =
                    MapEntry(routineController.text, movementsList);
                routinesTemp.addEntries([routineEntry]);
                routineList.value = {};
                routineList.value = routinesTemp;
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
