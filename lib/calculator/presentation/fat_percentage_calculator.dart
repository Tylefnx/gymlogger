import 'dart:math' as m;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/calculator/shared/dropdowns.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';

class FatPercentageCalculator extends HookWidget {
  const FatPercentageCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final genderController = useState<String?>(null);
    final bodyFatController = useState<double>(0);
    final bwController = useTextEditingController();
    final neckController = useTextEditingController();
    final waistController = useTextEditingController();
    final heightController = useTextEditingController();
    final hipController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: AppPadding.h30v40(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GenderSelectionWidget(gender: genderController),
              SB_AppPadding.h10(),
              MeasurementSelectionSection(
                weightController: heightController,
                label: 'Height',
              ),
              SB_AppPadding.h10(),
              MeasurementSelectionSection(
                weightController: waistController,
                label: 'Waist',
              ),
              SB_AppPadding.h10(),
              MeasurementSelectionSection(
                weightController: neckController,
                label: 'Neck',
              ),
              SB_AppPadding.h10(),
              if (genderController.value == 'female')
                MeasurementSelectionSection(
                  weightController: hipController,
                  label: 'Hips',
                ),
              if (genderController.value == 'female') SB_AppPadding.h10(),
              BWSelectionSection(bwController: bwController),
              SB_AppPadding.h10(),
              if (bodyFatController.value != 0)
                AppText.big_bold(text: bodyFatController.value.toString()),
              if (bwController.text != '0') SB_AppPadding.h10(),
              AppButton(
                onPressed: () {
                  final bw = double.parse(bwController.text);
                  final height = double.parse(heightController.text);
                  final neck = double.parse(neckController.text);
                  final waist = double.parse(waistController.text);
                  var hips = 0.0;
                  if (genderController.value == 'female') {
                    hips = double.parse(hipController.text);
                  }
                  if (genderController.value != null) {
                    final bodyFat = calculateBodyFat(
                      genderController.value!,
                      waist,
                      neck,
                      height,
                      hips,
                    );
                    bodyFatController.value = bodyFat;
                  }
                },
                title: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double calculateBodyFat(
  String gender,
  double waist,
  double neck,
  double height,
  double? hip,
) {
  double log10(num x) => m.log(x) / m.log(10);
  if (gender == 'male') {
    return double.parse(
      (495 /
                  (1.0324 -
                      0.19077 * log10(waist - neck) +
                      0.15456 * log10(height)) -
              450)
          .toStringAsFixed(2),
    );
  } else if (gender == 'female' && hip != null) {
    return double.parse(
      (495 /
                  (1.29579 -
                      0.35004 * log10(waist + hip - neck) +
                      0.22100 * log10(height)) -
              450)
          .toStringAsFixed(2),
    );
  }
  return 0;
}
