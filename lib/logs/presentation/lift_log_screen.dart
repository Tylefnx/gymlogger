import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/logs/domain/movement_log.dart';
import 'package:gymlogger/logs/domain/movement_log_for_specific_lift.dart';
import 'package:gymlogger/logs/domain/predictions.dart';
import 'package:gymlogger/logs/presentation/add_lift.dart';
import 'package:gymlogger/logs/presentation/lift_graphics.dart';
import 'package:gymlogger/logs/presentation/one_lift_list.dart';
import 'package:gymlogger/logs/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
        onPageChanged: (_) {
          navIndex.value = _;
        },
        children: [
          LiftGraphics(
            pageController: pageController,
            liftName: lift,
            movementLogsForSpecificLift: movementLogsForSpecificLift,
            predictions: predictions,
          ),
          OneLiftList(
            pageController: pageController,
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
    final colorScheme = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      unselectedItemColor: Colors.white38,
      fixedColor: colorScheme.onPrimary,
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme.primary,
      currentIndex: navIndex.value,
      elevation: 5,
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

class NoLogsFound extends StatelessWidget {
  const NoLogsFound({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextButton(
          onPressed: () => pageController.jumpToPage(2),
          title: 'No logs found\nTap here to add a new lift',
        ),
      ],
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
