import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/logs/domain/lift_logs.dart';
import 'package:gymlogger/logs/domain/movement_log_for_specific_lift.dart';
import 'package:gymlogger/logs/domain/predictions.dart';
import 'package:gymlogger/logs/presentation/lift_log_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiftGraphics extends HookConsumerWidget {
  final PageController pageController;
  final String liftName;
  final MovementLogsForSpecificLift movementLogsForSpecificLift;
  final Predictions predictions;
  const LiftGraphics({
    super.key,
    required this.liftName,
    required this.pageController,
    required this.movementLogsForSpecificLift,
    required this.predictions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementLogs = useState(movementLogsForSpecificLift.logs.toList());
    if (movementLogs.value.isNotEmpty && predictions.prediction.isNotEmpty) {
      final lastMovementLog = movementLogsForSpecificLift.logs.last;
      final lastDate = useState(
        parseDateString(
          lastMovementLog.date,
        ),
      );

      useEffect(
        () {
          getLiftLogsFromPredictions(lastDate, movementLogs, lastMovementLog);
          return null;
        },
        [],
      );
    }
    return movementLogs.value.isEmpty
        ? NoLogsFound(
            pageController: pageController,
          )
        : SfCartesianChart(
            primaryXAxis: const DateTimeAxis(
              labelRotation: -45,
            ),
            title: ChartTitle(text: '$liftName PR Progress'),
            series: <CartesianSeries>[
              // Tüm veriler
              LineSeries<LiftLog, DateTime>(
                dataSource: movementLogs.value == [] ? [] : movementLogs.value,
                xValueMapper: (LiftLog log, _) =>
                    DateTime.parse(log.date).toLocal(),
                yValueMapper: (LiftLog log, _) => log.weight,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                ),
              ),
            ],
          );
  }

  void getLiftLogsFromPredictions(ValueNotifier<DateTime> lastDate,
      ValueNotifier<List<LiftLog>> movementLogs, LiftLog lastMovementLog) {
    for (final prediction in predictions.prediction) {
      final fixedPrediction = double.parse(prediction.toStringAsFixed(2));
      lastDate.value = lastDate.value.add(const Duration(days: 30));
      movementLogs.value.add(
        LiftLog.fromPredictions(
          lastDate: lastDate.value,
          prediction: fixedPrediction,
          exercise: liftName,
          age: lastMovementLog.age,
          bodyWeight: lastMovementLog.bodyweight,
          sex: lastMovementLog.sex,
        ),
      );
    }
  }
}
