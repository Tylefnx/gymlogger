import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/router/app_router.dart';

class MyRoutines extends HookWidget {
  final ValueNotifier<Map<String, Map<String, List<int>>>> routines;
  const MyRoutines({super.key, required this.routines});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: routines.value.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoutineCard(label: routines.value.keys.elementAt(index)),
          ],
        );
      },
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
      onTap: () => context.pushRoute(
        RoutineLiftDetailsRoute(
          routineName: label,
        ),
      ),
      child: Card(
        child: AppPadding.h10v20(
          child: AppText.bold(text: label),
        ),
      ),
    );
  }
}
