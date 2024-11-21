import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';

class CreateRoutine extends HookWidget {
  final ValueNotifier<Map<String, Map<String, List<int>>>> routineList;
  const CreateRoutine({super.key, required this.routineList});

  @override
  Widget build(BuildContext context) {
    final routineController = useTextEditingController();
    var textEditingControllers = useState<List<List<TextEditingController>>>(
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
        title: AppText(text: 'Create Routine'),
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
                textEditingControllers.value.forEach(
                  (ctList) => ctList.forEach(
                    (b) {
                      if (b.text == '') {
                        return;
                      }
                    },
                  ),
                );
                Map<String, List<int>> movements_list = {};
                textEditingControllers.value.forEach((ctList) {
                  final movement_entry = MapEntry(ctList[0].text, [
                    int.parse(ctList[1].text),
                    int.parse(ctList[2].text),
                    int.parse(ctList[3].text)
                  ]);
                  movements_list.addEntries([movement_entry]);
                });
                var routinesTemp = routineList.value;
                final routine_entry =
                    MapEntry(routineController.text, movements_list);
                routinesTemp.addEntries([routine_entry]);
                routineList.value = {};
                routineList.value = routinesTemp;
                GoRouter.of(context).pop();
              },
              title: 'Add Routine',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var tempList = List<List<TextEditingController>>.from(
              textEditingControllers.value);
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
        child: Icon(Icons.add),
      ),
    );
  }
}
