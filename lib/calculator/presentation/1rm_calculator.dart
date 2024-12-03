import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/app_text_form_field.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:numberpicker/numberpicker.dart';

@RoutePage()
class OneRepMaxCalculator extends HookWidget {
  const OneRepMaxCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final weightFormController = useTextEditingController(text: '0');
    final selectedNumber = useState(1);
    final repMaxes = useState(<double>[]);
    return Scaffold(
      appBar: AppBar(),
      body: AppPadding.h30v40(
        child: Column(
          children: [
            OneRepMaxWeightSelectionSection(
              reps: selectedNumber,
              weight: weightFormController,
              repMaxes: repMaxes,
            ),
            SB_AppPadding.h10(),
            RepsPicker(
              selectedNumber: selectedNumber,
              weight: weightFormController,
              repMaxes: repMaxes,
            ),
            SB_AppPadding.h10(),
            RepMaxCalculatorResult(repMaxes: repMaxes),
          ],
        ),
      ),
    );
  }
}

class RepMaxCalculatorResult extends StatelessWidget {
  const RepMaxCalculatorResult({
    super.key,
    required this.repMaxes,
  });

  final ValueNotifier<List<double>> repMaxes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: repMaxes.value.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.big_bold(text: '${index + 1}RMX'),
              AppText.big_bold(
                text: repMaxes.value[index].toStringAsFixed(2),
              ),
            ],
          );
        },
      ),
    );
  }
}

class RepsPicker extends StatelessWidget {
  final ValueNotifier<List<double>> repMaxes;
  final TextEditingController weight;
  final ValueNotifier<int> selectedNumber;

  const RepsPicker({
    super.key,
    required this.selectedNumber,
    required this.weight,
    required this.repMaxes,
  });

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      itemCount: 5,
      infiniteLoop: true,
      textStyle: const TextStyle(fontSize: 18),
      selectedTextStyle: const TextStyle(fontSize: 32),
      axis: Axis.horizontal,
      minValue: 1,
      maxValue: 10,
      value: selectedNumber.value,
      onChanged: (_) {
        selectedNumber.value = _;
        repMaxes.value = calculateRepMaxes(
          calculateOneRepMax(
            double.tryParse(weight.text) ?? 0,
            _,
          ),
          repMaxes,
        );
      },
    );
  }
}

class OneRepMaxWeightSelectionSection extends StatelessWidget {
  final ValueNotifier<List<double>> repMaxes;
  final TextEditingController weight;
  final ValueNotifier<int> reps;
  const OneRepMaxWeightSelectionSection({
    super.key,
    required this.reps,
    required this.weight,
    required this.repMaxes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppTextFormField.numberWithOptions(
            controller: weight,
            label: 'Weight',
            suffixText: 'KG',
            onChanged: (_) {
              repMaxes.value = calculateRepMaxes(
                calculateOneRepMax(
                  double.tryParse(_) ?? 0,
                  reps.value,
                ),
                repMaxes,
              );
            },
          ),
        ),
      ],
    );
  }
}

double calculateOneRepMax(double weight, int reps) {
  return weight * (36 / (37 - reps));
}

List<double> calculateRepMaxes(
  double oneRepMax,
  ValueNotifier<List<double>> repMaxes,
) {
  if (oneRepMax == 0) return [];
  final repMaxes = <double>[];
  for (int i = 0; i < 10; i++) {
    final indexRepMax = oneRepMax / (36 / (37 - i - 1));
    repMaxes.add(indexRepMax);
  }
  print(repMaxes);
  return repMaxes;
}
