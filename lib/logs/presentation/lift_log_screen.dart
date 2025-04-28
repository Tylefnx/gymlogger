import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/logs/domain/lift_logs.dart';
import 'package:gymlogger/logs/domain/movement_log.dart';
import 'package:gymlogger/logs/domain/movement_log_for_specific_lift.dart';
import 'package:gymlogger/logs/domain/predictions.dart';
import 'package:gymlogger/logs/presentation/add_lift.dart';
import 'package:gymlogger/logs/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

@RoutePage()
class LiftLogScreen extends HookConsumerWidget {
  final String lift;
  const LiftLogScreen({super.key, required this.lift});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liftsState = ref.watch(movementsStateNotifierProvider);
    final predictionsState = ref.watch(predictionsStateNotifierProvider);
    final movementLogsForSpecificLift = liftsState.maybeMap(
      orElse: () => const MovementLogsForSpecificLift(lift: '', logs: []),
      loaded: (_) => _getMovementLogForLift(
        lift: lift,
        movementLogs: _.movementLogs,
      ),
    );
    final predictions = predictionsState.maybeMap(
      orElse: () => const Predictions(prediction: []),
      loaded: (_) => _.predictions,
    );
    final navIndex = useState<int>(0);
    final pageController = usePageController();
    return Scaffold(
      bottomNavigationBar: LiftLogPageNavigationBar(
        navIndex: navIndex,
        pageController: pageController,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: AppText(text: lift),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (_) => navIndex.value = _,
        children: [
          LiftGraphics(
            liftName: lift,
            movementLogsForSpecificLift: movementLogsForSpecificLift,
            predictions: predictions,
          ),
          OneLiftList(
            liftName: lift,
            movementLogsForSpecificLift: movementLogsForSpecificLift,
            predictions: predictions,
          ),
          AddLiftScreen(
            lift: lift,
            movementLogsForSpecificLift: movementLogsForSpecificLift,
            pageController: pageController,
            navigatorIndex: navIndex,
          ),
        ],
      ),
    );
  }
}

class LiftLogPageNavigationBar extends StatelessWidget {
  const LiftLogPageNavigationBar({
    super.key,
    required this.navIndex,
    required this.pageController,
  });

  final ValueNotifier<int> navIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: navIndex.value,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.graphic_eq),
          label: 'Logs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Lifts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center_sharp),
          label: 'Add Lift',
        ),
      ],
      onTap: (_) {
        navIndex.value = _;
        pageController.jumpToPage(navIndex.value);
      },
    );
  }
}

class LiftGraphics extends HookConsumerWidget {
  final String liftName;
  final MovementLogsForSpecificLift movementLogsForSpecificLift;
  final Predictions predictions;
  const LiftGraphics({
    super.key,
    required this.liftName,
    required this.movementLogsForSpecificLift,
    required this.predictions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementLogs = useState(movementLogsForSpecificLift.logs.toList());
    if (movementLogs.value != []) {
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
    } else {
      movementLogs.value.add(
        LiftLog(
          exercise: liftName,
          age: 0,
          bodyweight: 0,
          date: DateTime.now().toString(),
          sex: 'male',
          weight: 0,
        ),
      );
    }

    return SfCartesianChart(
      primaryXAxis: const DateTimeAxis(
        labelRotation: -45,
      ),
      title: ChartTitle(text: '$liftName PR Progress'),
      series: <CartesianSeries>[
        // Tüm veriler
        LineSeries<LiftLog, DateTime>(
          dataSource: movementLogs.value == [] ? [] : movementLogs.value,
          xValueMapper: (LiftLog log, _) => DateTime.parse(log.date).toLocal(),
          yValueMapper: (LiftLog log, _) => log.weight,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
        ),
        // Son 6 veri
        if (movementLogs.value.length >= 6 && movementLogs.value.isNotEmpty)
          LineSeries<LiftLog, DateTime>(
            dataSource:
                movementLogs.value.sublist(movementLogs.value.length - 6),
            xValueMapper: (LiftLog log, _) =>
                DateTime.parse(log.date).toLocal(),
            yValueMapper: (LiftLog log, _) => log.weight,
            color: Colors.red,
            width: 2,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(color: Colors.red),
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

class OneLiftList extends HookWidget {
  final MovementLogsForSpecificLift movementLogsForSpecificLift;
  final String liftName;
  final Predictions predictions;
  const OneLiftList({
    super.key,
    required this.liftName,
    required this.movementLogsForSpecificLift,
    required this.predictions,
  });

  @override
  Widget build(BuildContext context) {
    final lastLogDate = movementLogsForSpecificLift.logs.last.date;
    return Stack(
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
    final prediction = predictions.prediction[predictionIndex];
    final predictionDate = useState(parseDateString(lastLogDate));
    predictionDate.value.add(const Duration(days: 30));
    return ListTile(
      tileColor: index.isOdd ? Colors.grey[200] : Colors.white,
      leading: AppText.big_bold(
        text:
            '${predictionDate.value.toString().substring(8, 10)}/${predictionDate.value.month}/${predictionDate.value.year}:',
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText.big_bold(
            text: '${prediction.toStringAsFixed(2)}KG',
          ),
          AppText.normal(
            text: 'Prediction',
            color: Colors.pink,
          ),
        ],
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
    final liftEntry = movementLogsForSpecificLift.logs[index];
    final date = liftEntry.date.split('-');
    return ListTile(
      tileColor: index.isOdd ? Colors.grey[200] : Colors.white,
      leading: AppText.big_bold(
        text: '${date[2]}/${date[1]}/${date[0]}:',
      ),
      trailing: AppText.big_bold(
        text: '${liftEntry.weight}KG',
      ),
    );
  }
}

MovementLogsForSpecificLift _getMovementLogForLift(
    {required String lift, required MovementLogs movementLogs}) {
  final logs = movementLogs.logs.where((log) => log.exercise == lift).toList();
  final movementLogsForSpecificLift = MovementLogsForSpecificLift(
    lift: lift,
    logs: logs,
  );
  return movementLogsForSpecificLift;
}

DateTime parseDateString(String dateString) {
  final format = DateFormat('yyyy-MM-dd');
  return format.parse(dateString);
}
