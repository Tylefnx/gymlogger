import 'dart:math' as m;
import 'package:flutter/material.dart';

class FatPercentageCalculator extends StatelessWidget {
  const FatPercentageCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
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
  if (gender == 'male') {
    return 86.010 * m.log(waist - neck) - 70.041 * m.log(height) + 36.76;
  } else if (gender == 'woman' && hip != null) {
    return 163.205 * m.log(waist + hip - neck) -
        97.684 * m.log(height) -
        78.387;
  }
  return 0;
}
