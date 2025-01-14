import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/logs/domain/lift_logs.dart';
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
    final lifts = liftsState.maybeMap(
      orElse: () => <String, double>{},
      loaded: (_) =>
          getMovementLogForLift(
            lift: lift,
            logs: _.liftLogs,
          ) ??
          <String, double>{},
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
            lifts: lifts.entries.toList(),
          ),
          OneLiftList(
            liftName: lift,
            lifts: lifts.entries.toList(),
          ),
          AddLiftScreen(
            lift: lift,
            lifts: lifts.entries.toList(),
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
  final List<MapEntry<String, double>> lifts;
  const LiftGraphics({
    super.key,
    required this.liftName,
    required this.lifts,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const DateTimeAxis(
        labelRotation: -45, // Tarihlerin okunabilir olmasını sağlamak için
      ),
      title: ChartTitle(text: '$liftName PR Progress'),
      series: <CartesianSeries>[
        LineSeries<MapEntry<String, double>, DateTime>(
          dataSource: lifts,
          xValueMapper: (MapEntry<String, double> data, _) =>
              DateTime.parse(data.key).toLocal(),
          yValueMapper: (MapEntry<String, double> data, _) =>
              data.value, // Ağırlık
          dataLabelSettings: const DataLabelSettings(
              isVisible: true), // Veri etiketlerini göster
        ),
      ],
    );
  }
}

class OneLiftList extends HookWidget {
  final List<MapEntry<String, double>> lifts;
  final String liftName;
  const OneLiftList({
    super.key,
    required this.liftName,
    required this.lifts,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: lifts.length,
          itemBuilder: (BuildContext context, int index) {
            final liftEntry = lifts[index];
            final date = liftEntry.key.split('-');
            return ListTile(
              tileColor: index.isOdd ? Colors.grey[200] : Colors.white,
              leading: AppText.big_bold(
                text: '${date[2]}/${date[1]}/${date[0]}:',
              ),
              trailing: AppText.big_bold(
                text: '${liftEntry.value}KG',
              ),
            );
          },
        ),
      ],
    );
  }
}

Map<String, double>? getMovementLogForLift(
    {required String lift, required LiftLogs logs}) {
  switch (lift) {
    case 'Squat':
      return logs.squat;
    case 'Bench Press':
      return logs.bench;
    case 'Deadlift':
      return logs.deadlift;
    case 'Overhead Press':
      return logs.ohp;
    default:
      return null;
  }
}
