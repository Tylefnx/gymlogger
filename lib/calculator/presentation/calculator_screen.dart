import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_gridview.dart';
import 'package:gymlogger/core/router/app_router.dart';

@RoutePage()
class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGridviewWidget(
      children: [
        GridviewSectionCard(
          label: '1RM',
          icon: Icons.fitness_center,
          onTap: () => AutoRouter.of(context).push(const OneRepMaxRoute()),
        ),
        GridviewSectionCard(
          label: 'Strength Level',
          icon: Icons.fitness_center_outlined,
          onTap: () => AutoRouter.of(context).push(const StrengthLevelRoute()),
        ),
        GridviewSectionCard(
          label: 'Fat Percentage',
          icon: Icons.generating_tokens_sharp,
          onTap: () => AutoRouter.of(context).push(const FatPercentageRoute()),
        ),
      ],
    );
  }
}
