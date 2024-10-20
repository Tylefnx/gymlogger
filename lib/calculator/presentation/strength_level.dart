import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_dropdown_button.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';

class StrengthLevelCalculator extends HookWidget {
  const StrengthLevelCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    final weightController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Strength Level Calculator'),
      ),
      body: AppPadding.h30v40(
        child: Column(
          children: [
            AppTextFormField.numberWithOptions(
              label: 'Weight',
              controller: weightController,
            ),
            AppDropDownButton(
              items: [
                DropdownMenuItem(
                  child: Text(
                    'Squat',
                  ),
                  value: 'Squat',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Bench Press',
                  ),
                  value: 'Bench Press',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Deadlift',
                  ),
                  value: 'Deadlift',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Barbell Row',
                  ),
                  value: 'Barbell Row',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Overhead Press',
                  ),
                  value: 'Overhead Press',
                ),
                DropdownMenuItem(
                  child: Text(
                    'Weighted Dips',
                  ),
                  value: 'Weighted Dips',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
