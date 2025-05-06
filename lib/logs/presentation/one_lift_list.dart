import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/logs/domain/movement_log_for_specific_lift.dart';
import 'package:gymlogger/logs/domain/predictions.dart';
import 'package:gymlogger/logs/presentation/lift_log_screen.dart';

class OneLiftList extends HookWidget {
  final MovementLogsForSpecificLift movementLogsForSpecificLift;
  final String liftName;
  final Predictions predictions;
  final PageController pageController;
  const OneLiftList({
    super.key,
    required this.liftName,
    required this.movementLogsForSpecificLift,
    required this.predictions,
    required this.pageController,
  });
  @override
  Widget build(BuildContext context) {
    final lastLogDate = movementLogsForSpecificLift.logs.isEmpty
        ? ''
        : movementLogsForSpecificLift.logs.last.date;
    return movementLogsForSpecificLift.logs.isEmpty
        ? NoLogsFound(
            pageController: pageController,
          )
        : Stack(
            children: [
              ListView.builder(
                itemCount: movementLogsForSpecificLift.logs.length +
                    predictions.prediction.length,
                itemBuilder: (BuildContext context, int index) {
                  final predictionIndex =
                      index - movementLogsForSpecificLift.logs.length;
                  if (index < movementLogsForSpecificLift.logs.length) {
                    return LiftEntryListTile(
                      movementLogsForSpecificLift: movementLogsForSpecificLift,
                      index: index,
                    );
                  } else {
                    return PredictionListTile(
                      predictionIndex: predictionIndex,
                      index: index,
                      predictions: predictions,
                      lastLogDate: lastLogDate,
                    );
                  }
                },
              ),
            ],
          );
  }
}

class PredictionListTile extends HookWidget {
  const PredictionListTile({
    super.key,
    required this.predictionIndex,
    required this.index,
    required this.predictions,
    required this.lastLogDate,
  });

  final int predictionIndex;
  final int index;
  final Predictions predictions;
  final String lastLogDate;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final prediction = predictions.prediction[predictionIndex];
    final predictionDate = useState(parseDateString(lastLogDate));
    predictionDate.value = predictionDate.value.add(const Duration(days: 30));

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: index.isOdd ? colorScheme.onSecondary : colorScheme.primary,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Chip(
          label: Text(
            '${predictionDate.value.day}/${predictionDate.value.month}/${predictionDate.value.year}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueAccent.withOpacity(0.2),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${prediction.toStringAsFixed(2)} KG',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Prediction',
              style: TextStyle(color: Colors.pink),
            ),
          ],
        ),
      ),
    );
  }
}

class LiftEntryListTile extends StatelessWidget {
  const LiftEntryListTile({
    super.key,
    required this.movementLogsForSpecificLift,
    required this.index,
  });

  final MovementLogsForSpecificLift movementLogsForSpecificLift;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final liftEntry = movementLogsForSpecificLift.logs[index];
    final date = liftEntry.date.split('-');

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: index.isOdd ? Colors.deepPurple[200] : colorScheme.inversePrimary,
      child: ListTile(
        leading: Chip(
          label: AppText.bold(
            text: '${date[2]}/${date[1]}/${date[0]}',
          ),
          backgroundColor: colorScheme.surfaceContainerHigh,
        ),
        title: AppText.bold(
          text: liftEntry.exercise,
        ),
        subtitle: AppText.normal(
          text: '${liftEntry.weight}KG',
        ),
        trailing: Icon(Icons.fitness_center, color: colorScheme.primary),
      ),
    );
  }
}
