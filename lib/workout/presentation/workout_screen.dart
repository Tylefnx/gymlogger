import 'package:flutter/material.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:gymlogger/workout/presentation/my_routines.dart';

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
