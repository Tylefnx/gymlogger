import 'package:flutter/material.dart';

class StrengthLevelCalculator extends StatelessWidget {
  const StrengthLevelCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Strength Level Calculator'),
      ),
      body: Column(
        children: [
          TextFormField(),
          TextFormField(),
          TextFormField(),
        ],
      ),
    );
  }
}
