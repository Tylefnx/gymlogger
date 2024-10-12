import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppPadding.h10v20(
        child: Column(
          children: [
            AppText.big_bold(text: 'Quick Start'),
            AppPadding.v15(
              child: AppAddButton(
                text: 'Start Empty Workout',
              ),
            ),
            AppText.big_bold(text: 'Routines'),
            AppPadding.v15(child: RoutinesSection()),
            AppText.big_bold(text: 'My Routines'),
            Expanded(child: MyRoutines()),
          ],
        ),
      ),
    );
  }
}

class RoutinesSection extends StatelessWidget {
  const RoutinesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppTallButton(
            text: 'New Routine',
            icondata: Icons.bookmark_add,
          ),
        ),
        SB_AppPadding.w15(),
        Expanded(
          child: AppTallButton(
            text: 'Explore',
            icondata: Icons.search,
          ),
        ),
      ],
    );
  }
}

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
          RoutineCard(label: 'Spoto Day'),
          RoutineCard(label: 'Spoto Day'),
          RoutineCard(label: 'Spoto Day'),
          RoutineCard(label: 'Spoto Day'),
          RoutineCard(label: 'Spoto Day'),
          RoutineCard(label: 'Spoto Day'),
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
      onTap: () {},
      child: Card(
        child: AppPadding.h10v20(
          child: AppText.bold(text: label),
        ),
      ),
    );
  }
}
