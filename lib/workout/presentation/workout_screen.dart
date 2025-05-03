import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:gymlogger/workout/presentation/my_routines.dart';

@RoutePage()
class WorkoutScreen extends HookWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPadding.h10v20(
      child: Column(
        children: [
          AppPadding.v25(
            child: const RoutinesSection(),
          ),
          AppText.big_bold(
            text: 'My Routines',
            color: Colors.deepPurple,
          ),
          const Expanded(
            child: MyRoutines(),
          ),
        ],
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
    return Column(
      children: [
        // Yeni rutin oluşturmak için buton:
        AppTallButton(
          onPressed: () => AutoRouter.of(context).push(
            const CreateRoutineRoute(),
          ),
          text: 'New Routine',
          icondata: Icons.bookmark_add,
        ),
        SBAppPadding.h10(),
        AppTallButton(
          text: 'Explore',
          icondata: Icons.search,
          onPressed: () {},
        ),
      ],
    );
  }
}
