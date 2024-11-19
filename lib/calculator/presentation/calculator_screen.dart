import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymlogger/core/presentation/app_gridview.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGridviewWidget(
      children: [
        GridviewSectionCard(
          label: '1RM',
          icon: Icons.fitness_center,
          onTap: () => GoRouter.of(context).push('/calculators/1RM'),
        ),
        GridviewSectionCard(
          label: 'Strength Level',
          icon: Icons.fitness_center_outlined,
          onTap: () => GoRouter.of(context).push('/calculators/str_level'),
        ),
        GridviewSectionCard(
          label: 'Fat Percentage',
          icon: Icons.generating_tokens_sharp,
          onTap: () => GoRouter.of(context).push('/calculators/fat_percentage'),
        ),
      ],
    );
  }
}
