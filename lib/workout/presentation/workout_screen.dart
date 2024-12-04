import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:gymlogger/workout/presentation/dummy_training.dart';
import 'package:gymlogger/workout/presentation/my_routines.dart';

@RoutePage()
class WorkoutScreen extends HookWidget {
  const WorkoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routines =
        useState<Map<String, Map<String, List<int>>>>(DummyRoutines);
    return Center(
      child: AppPadding.h10v20(
        child: Column(
          children: [
            AppText.big_bold(text: 'Quick Start'),
            AppPadding.v15(
              child: const AppAddButton(
                text: 'Start Empty Workout',
              ),
            ),
            AppText.big_bold(text: 'Routines'),
            AppPadding.v15(
              child: RoutinesSection(
                routines: routines,
              ),
            ),
            AppText.big_bold(text: 'My Routines'),
            Expanded(
              child: MyRoutines(
                routines: routines,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoutinesSection extends StatelessWidget {
  final ValueNotifier<Map<String, Map<String, List<int>>>> routines;
  const RoutinesSection({
    super.key,
    required this.routines,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppTallButton(
            onPressed: () => AutoRouter.of(context).push(
              CreateRoutineRoute(
                routineList: routines,
              ),
            ),
            text: 'New Routine',
            icondata: Icons.bookmark_add,
          ),
        ),
        SB_AppPadding.w15(),
        const Expanded(
          child: AppTallButton(
            text: 'Explore',
            icondata: Icons.search,
          ),
        ),
      ],
    );
  }
}
