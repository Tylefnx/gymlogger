import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/workout/presentation/dummy_training.dart';

@RoutePage(name: 'RoutineDetailsRoute')
class RoutineDetailsPage extends HookWidget {
  final String routineName;
  const RoutineDetailsPage({
    super.key,
    @PathParam('routineName') required this.routineName,
  });

  @override
  Widget build(BuildContext context) {
    final routine = useState(DummyRoutines[routineName]!.entries.toList());
    return Scaffold(
      appBar: AppBar(),
      body: AppPadding.h30v40(
        child: ListView.builder(
          itemCount: routine.value.length,
          itemBuilder: (BuildContext context, int index) {
            final movement = routine.value[index];
            return AppText.big_bold(
              text:
                  '${movement.key}: ${movement.value[0]} x ${movement.value[1]} x ${movement.value[2]}',
            );
          },
        ),
      ),
    );
  }
}
