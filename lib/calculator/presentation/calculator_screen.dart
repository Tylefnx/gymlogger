import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      crossAxisCount: 2,
      children: [
        CalculatorSectionCard(
          label: '1RM',
          icon: Icons.fitness_center,
          onTap: () => GoRouter.of(context).push('/calculators/1RM'),
        ),
        CalculatorSectionCard(
          label: 'Strength Level',
          icon: Icons.fitness_center_outlined,
          onTap: () => null,
        ),
        CalculatorSectionCard(
          label: 'Fat Percentage',
          icon: Icons.generating_tokens_sharp,
          onTap: () => null,
        ),
      ],
    );
  }
}

class CalculatorSectionCard extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final IconData icon;
  const CalculatorSectionCard({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(),
            Icon(
              icon,
              size: 90,
            ),
            AppText.big_bold(text: label),
          ],
        ),
      ),
    );
  }
}
