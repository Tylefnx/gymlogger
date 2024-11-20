import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AppNumberPicker extends StatelessWidget {
  final ValueNotifier<int> selectedReps;
  const AppNumberPicker({super.key, required this.selectedReps});

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      itemCount: 5,
      infiniteLoop: true,
      textStyle: TextStyle(fontSize: 18),
      selectedTextStyle: TextStyle(fontSize: 32),
      axis: Axis.horizontal,
      minValue: 1,
      maxValue: 10,
      value: selectedReps.value,
      onChanged: (_) => selectedReps.value = _,
    );
  }
}
