import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';

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
      onTap: () => GoRouter.of(context).push('/workout/$label'),
      child: Card(
        child: AppPadding.h10v20(
          child: AppText.bold(text: label),
        ),
      ),
    );
  }
}
