import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/logs/domain/lift_logs.dart';
import 'package:gymlogger/logs/domain/movement_log.dart';
import 'package:gymlogger/logs/domain/movement_log_for_specific_lift.dart';
import 'package:gymlogger/logs/presentation/add_lift.dart';
import 'package:gymlogger/logs/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

@RoutePage()
class LiftLogScreen extends HookConsumerWidget {
  final String lift;
  const LiftLogScreen({super.key, required this.lift});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liftsState = ref.watch(movementsStateNotifierProvider);
    final movementLogsForSpecificLift = liftsState.maybeMap(
      orElse: () => const MovementLogsForSpecificLift(lift: '', logs: []),
      loaded: (_) => getMovementLogForLift(
        lift: lift,
        movementLogs: _.movementLogs,
      ),
    );
    //useState(userLifts[lift]!.entries.toList());
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
          ),
          OneLiftList(
            liftName: lift,
            movementLogsForSpecificLift: movementLogsForSpecificLift,
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

class LiftGraphics extends HookWidget {
  final String liftName;
  final MovementLogsForSpecificLift movementLogsForSpecificLift;
  const LiftGraphics({
    super.key,
    required this.liftName,
    required this.movementLogsForSpecificLift,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const DateTimeAxis(
        labelRotation: -45,
      ),
      title: ChartTitle(text: '$liftName PR Progress'),
      series: <CartesianSeries>[
        LineSeries<LiftLog, DateTime>(
          dataSource: movementLogsForSpecificLift.logs,
          xValueMapper: (LiftLog log, _) => DateTime.parse(log.date).toLocal(),
          yValueMapper: (LiftLog log, _) => log.weight, // Ağırlık
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
        ),
      ],
    );
  }
}

class OneLiftList extends HookWidget {
  final MovementLogsForSpecificLift movementLogsForSpecificLift;
  final String liftName;
  const OneLiftList({
    super.key,
    required this.liftName,
    required this.movementLogsForSpecificLift,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: movementLogsForSpecificLift.logs.length,
          itemBuilder: (BuildContext context, int index) {
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
          },
        ),
      ],
    );
  }
}

MovementLogsForSpecificLift getMovementLogForLift(
    {required String lift, required MovementLogs movementLogs}) {
  final movementLogsForSpecificLift = MovementLogsForSpecificLift(
    lift: lift,
    logs: movementLogs.logs.where((log) => log.exercise == lift).toList(),
  );
  return movementLogsForSpecificLift;
}
