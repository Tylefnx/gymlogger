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
      appBar: AppBar(
        title: const Text('One Rep Max Calculator'), // Added title
      ),
      body: AppPadding.h10v20(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Added stretch
          children: [
            Card(
              // Wrapped in Card for visual separation
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: OneRepMaxWeightSelectionSection(
                  reps: selectedNumber,
                  weight: weightFormController,
                  repMaxes: repMaxes,
                ),
              ),
            ),
            SB_AppPadding.h10(),
            Card(
              // Wrapped in Card
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RepsPicker(
                  selectedNumber: selectedNumber,
                  weight: weightFormController,
                  repMaxes: repMaxes,
                ),
              ),
            ),
            SB_AppPadding.h10(), // Increased spacing
            Expanded(
              child: Card(
                // Wrapped in Card
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RepMaxCalculatorResult(repMaxes: repMaxes),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RepMaxCalculatorResult extends StatelessWidget {
  const RepMaxCalculatorResult({super.key, required this.repMaxes});

  final ValueNotifier<List<double>> repMaxes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // Use ListView.separated for dividers
      itemCount: repMaxes.value.length,
      separatorBuilder: (context, index) => const Divider(), // Added divider
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          // Added padding for list items
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.big_bold(text: '${index + 1} RMX'), // Added space
              AppText.big_bold(
                text: repMaxes.value[index].toStringAsFixed(2),
              ),
            ],
          ),
        );
      },
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
