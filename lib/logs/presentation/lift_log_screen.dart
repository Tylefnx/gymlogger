import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/logs/presentation/add_lift.dart';
import 'package:gymlogger/logs/presentation/dummy_lifts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiftLogScreen extends HookWidget {
  final String lift;
  const LiftLogScreen({super.key, required this.lift});

  @override
  Widget build(BuildContext context) {
    final lifts = useState(userLifts[lift]!.entries.toList());
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
            lifts: lifts,
          ),
          OneLiftList(
            liftName: lift,
            lifts: lifts,
          ),
          AddLiftScreen(
            lifts: lifts,
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
      items: [
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
  final ValueNotifier<List<MapEntry<String, double>>> lifts;
  const LiftGraphics({
    super.key,
    required this.liftName,
    required this.lifts,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        labelRotation: -45, // Tarihlerin okunabilir olmasını sağlamak için
      ),
      title: ChartTitle(text: '$liftName PR Progress'),
      series: <CartesianSeries>[
        LineSeries<MapEntry<String, double>, String>(
          dataSource: lifts.value,
          xValueMapper: (MapEntry<String, double> data, _) => data.key, // Tarih
          yValueMapper: (MapEntry<String, double> data, _) =>
              data.value, // Ağırlık
          dataLabelSettings:
              DataLabelSettings(isVisible: true), // Veri etiketlerini göster
        ),
      ],
    );
  }
}

class OneLiftList extends HookWidget {
  final ValueNotifier<List<MapEntry<String, double>>> lifts;
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
          itemCount: lifts.value.length,
          itemBuilder: (BuildContext context, int index) {
            final liftEntry = lifts.value[index];
            return ListTile(
              title: AppText.big_bold(
                text: '${liftEntry.key} : ${liftEntry.value}KG',
              ),
            );
          },
        ),
      ],
    );
  }
}
