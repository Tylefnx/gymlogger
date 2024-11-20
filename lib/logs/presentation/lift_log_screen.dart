import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiftLogScreen extends HookWidget {
  final String lift;
  const LiftLogScreen({super.key, required this.lift});

  @override
  Widget build(BuildContext context) {
    final navIndex = useState<int>(0);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
        onTap: (_) => navIndex.value = _,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: AppText(text: lift),
      ),
      body: PageView(
        onPageChanged: (_) => navIndex.value = _,
        children: [
          LiftGraphics(),
          OneLiftList(),
        ],
      ),
    );
  }
}

class LiftGraphics extends StatelessWidget {
  const LiftGraphics({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart();
  }
}

class OneLiftList extends StatelessWidget {
  const OneLiftList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return SizedBox();
      },
    );
  }
}
