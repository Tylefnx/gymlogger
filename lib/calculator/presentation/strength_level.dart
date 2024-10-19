import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
          ],
        ),
      ),
    );
  }
}
