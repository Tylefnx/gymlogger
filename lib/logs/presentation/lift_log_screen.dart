import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/logs/presentation/dummy_lifts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiftLogScreen extends HookWidget {
  final String lift;
  const LiftLogScreen({super.key, required this.lift});

  @override
  Widget build(BuildContext context) {
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
            lift: lift,
          ),
          OneLiftList(lift: lift),
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
      ],
      onTap: (_) {
        navIndex.value = _;
        pageController.jumpToPage(navIndex.value);
      },
    );
  }
}

class LiftGraphics extends HookWidget {
  final String lift;
  const LiftGraphics({super.key, required this.lift});

  @override
  Widget build(BuildContext context) {
    var liftData = userLifts[lift]!.entries.toList();
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        labelRotation: -45, // Tarihlerin okunabilir olmasını sağlamak için
      ),
      title: ChartTitle(text: '$lift PR Progress'),
      series: <CartesianSeries>[
        LineSeries<MapEntry<String, double>, String>(
          dataSource: liftData,
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
  final String lift;
  const OneLiftList({
    super.key,
    required this.lift,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: userLifts[lift]!.length,
          itemBuilder: (BuildContext context, int index) {
            final liftEntry = userLifts[lift]!.entries.toList()[index];
            return ListTile(
              title: AppText.big_bold(
                text: '${liftEntry.key} : ${liftEntry.value}KG',
              ),
            );
          },
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
