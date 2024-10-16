import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:numberpicker/numberpicker.dart';

class OneRepMaxCalculator extends HookWidget {
  const OneRepMaxCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final weightFormController = useTextEditingController(text: '0');
    final selectedNumber = useState(1);
    return Scaffold(
      appBar: AppBar(),
      body: AppPadding.h30v40(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: weightFormController,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SB_AppPadding.w30(),
                AppText.big_bold(text: 'KG'),
              ],
            ),
            SB_AppPadding.h10(),
            NumberPicker(
              itemCount: 5,
              infiniteLoop: true,
              textStyle: TextStyle(fontSize: 18),
              selectedTextStyle: TextStyle(fontSize: 32),
              axis: Axis.horizontal,
              minValue: 1,
              maxValue: 10,
              value: selectedNumber.value,
              onChanged: (_) => selectedNumber.value = _,
            ),
          ],
        ),
      ),
    );
  }
}
