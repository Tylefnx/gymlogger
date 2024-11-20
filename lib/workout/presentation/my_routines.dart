import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

class MyRoutines extends StatelessWidget {
  const MyRoutines({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RoutineCard(label: 'Heavy Squat Day'),
          RoutineCard(label: 'Pause Deadlift Day'),
          RoutineCard(label: '2ct P.Bench Day'),
          RoutineCard(label: 'Heavy Deadlift Day'),
          RoutineCard(label: 'Spoto Day'),
        ],
      ),
    );
  }
}

class RoutineCard extends StatelessWidget {
  final String label;
  const RoutineCard({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => GoRouter.of(context).push('/workout/$label'),
      child: Card(
        child: AppPadding.h10v20(
          child: AppText.bold(text: label),
        ),
      ),
    );
  }
}
