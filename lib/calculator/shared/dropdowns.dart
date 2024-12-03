import 'package:flutter/material.dart';
import 'package:gymlogger/core/constant_lists.dart';
import 'package:gymlogger/core/presentation/app_dropdown_button.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';

class ExcersizeSelectionSection extends StatelessWidget {
  const ExcersizeSelectionSection({
    super.key,
    required this.excersize,
    required this.strengthLevelExcersize,
  });

  final ValueNotifier<String?> excersize;
  final List<String?> strengthLevelExcersize;

  @override
  Widget build(BuildContext context) {
    return AppDropDownButton<String?>(
      hint: 'Select Excersize',
      value: excersize.value,
      onChanged: (_) => excersize.value = _,
      items: strengthLevelExcersize.map<DropdownMenuItem<String?>>((String? _) {
        return DropdownMenuItem(
          value: _,
          child: AppText.bold(text: _ ?? ''),
        );
      }).toList(),
    );
  }
}

class WeightSelectionSection extends StatelessWidget {
  const WeightSelectionSection({
    super.key,
    required this.weightController,
  });

  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField.numberWithOptions(
      label: 'Weight',
      controller: weightController,
    );
  }
}

class MeasurementSelectionSection extends StatelessWidget {
  const MeasurementSelectionSection({
    super.key,
    required this.weightController,
    required this.label,
  });

  final TextEditingController weightController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField.numberWithOptions(
      label: label,
      controller: weightController,
    );
  }
}

class BWSelectionSection extends StatelessWidget {
  const BWSelectionSection({
    super.key,
    required this.bwController,
  });

  final TextEditingController bwController;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField.numberWithOptions(
      label: 'Bodyweight',
      controller: bwController,
    );
  }
}

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({
    super.key,
    required this.gender,
  });

  final ValueNotifier<String?> gender;

  @override
  Widget build(BuildContext context) {
    return AppDropDownButton<String?>(
      hint: 'Select Gender',
      value: gender.value,
      onChanged: (_) => gender.value = _,
      items: genders.map<DropdownMenuItem<String>>((String? _) {
        return DropdownMenuItem(
          value: _,
          child: AppText.bold(text: _ ?? ''),
        );
      }).toList(),
    );
  }
}
