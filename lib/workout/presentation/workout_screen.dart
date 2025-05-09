import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gymlogger/authentication/shared/providers.dart';
import 'package:gymlogger/core/presentation/app_buttons.dart';
import 'package:gymlogger/core/presentation/app_padding.dart';
import 'package:gymlogger/core/presentation/app_text.dart';
import 'package:gymlogger/core/presentation/sb_app_padding.dart';
import 'package:gymlogger/core/router/app_router.dart';
import 'package:gymlogger/workout/domain/routine.dart';
import 'package:gymlogger/workout/domain/user_routines.dart';
import 'package:gymlogger/workout/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class WorkoutScreen extends HookConsumerWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routines = ref.watch(workoutStateNotifierProvider);
    final authState = ref.read(authStateNotifierProvider);
    final selectedDate = useState<DateTime>(DateTime.now());
    final selectedRoutines = useState<Map<DateTime, Routine>>({});
    final lastTappedDate = useState<DateTime?>(null);

    useEffect(
      () {
        authState.maybeMap(
          authenticated: (_) {
            ref.read(workoutStateNotifierProvider.notifier).getWorkoutRoutine(
                  username: _.user.username,
                  token: _.user.token,
                );
          },
          orElse: () {},
        );
        return null;
      },
      [routines],
    );

    return routines.map(
      loading: (_) => const Center(child: CircularProgressIndicator()),
      failed: (_) => Center(child: AppText.big_bold(text: _.toString())),
      loaded: (_) => AppPadding.h10v20(
        child: Column(
          children: [
            Expanded(
              child: WorkoutCalendarWidget(
                selectedDate: selectedDate,
                lastTappedDate: lastTappedDate,
                selectedRoutines: selectedRoutines,
                userRoutines: _.liftLogs,
              ),
            ),
            RoutinesSection(
              selectedDate: selectedDate,
              selectedRoutines: selectedRoutines,
              routines: _.liftLogs,
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutCalendarWidget extends StatelessWidget {
  const WorkoutCalendarWidget({
    super.key,
    required this.selectedDate,
    required this.lastTappedDate,
    required this.selectedRoutines,
    required this.userRoutines,
  });

  final ValueNotifier<DateTime> selectedDate;
  final ValueNotifier<DateTime?> lastTappedDate;
  final UserRoutines userRoutines;
  final ValueNotifier<Map<DateTime, Routine>> selectedRoutines;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2024, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: selectedDate.value,
      calendarFormat: CalendarFormat.week,
      selectedDayPredicate: (day) => isSameDay(selectedDate.value, day),
      onDaySelected: (selectedDay, focusedDay) {
        if (isSameDay(lastTappedDate.value, selectedDay)) {
          if (selectedRoutines.value.containsKey(selectedDay)) {
            AutoRouter.of(context).push(
              RoutineDetailsRoute(
                routineName: selectedRoutines.value[selectedDay]!.routineName,
              ),
            );
          } else {
            showRoutineSelectionDialog(
              context,
              selectedRoutines,
              userRoutines,
              selectedDay,
            );
          }
        } else {
          lastTappedDate.value = selectedDay;
          selectedDate.value = selectedDay;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Detaylar için tekrar tıklayın.")),
          );
        }
      },
      eventLoader: (day) => selectedRoutines.value.containsKey(day)
          ? [selectedRoutines.value[day]!.routineName]
          : [],
    );
  }
}

void showRoutineSelectionDialog(
    BuildContext context,
    ValueNotifier<Map<DateTime, Routine>> selectedRoutines,
    UserRoutines availableRoutines,
    DateTime selectedDate) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Rutin Seç"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...availableRoutines.routines.map(
              (routine) => ListTile(
                title: Text(routine.routineName),
                onTap: () {
                  selectedRoutines.value[selectedDate] = routine;
                  Navigator.pop(context);
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Yeni Rutin Oluştur"),
              leading: const Icon(Icons.add),
              onTap: () {
                Navigator.pop(context);
                AutoRouter.of(context).push(const CreateRoutineRoute());
              },
            ),
          ],
        ),
      );
    },
  );
}

class RoutinesSection extends StatelessWidget {
  final ValueNotifier<DateTime?> selectedDate;
  final UserRoutines routines;
  final ValueNotifier<Map<DateTime, Routine>> selectedRoutines;

  const RoutinesSection({
    super.key,
    required this.selectedDate,
    required this.selectedRoutines,
    required this.routines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTallButton(
          onPressed: () =>
              AutoRouter.of(context).push(const CreateRoutineRoute()),
          text: 'New Routine',
          icondata: Icons.bookmark_add,
        ),
        SBAppPadding.h10(),
        AppTallButton(
          text: "Explore",
          icondata: Icons.search,
          onPressed: () {},
        ),
        SBAppPadding.h10(),
      ],
    );
  }
}
