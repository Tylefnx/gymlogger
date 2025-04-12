import 'package:gymlogger/core/shared/dio.dart';
import 'package:gymlogger/workout/application/workout_notifier.dart';
import 'package:gymlogger/workout/infrastructure/workout_repository.dart';
import 'package:gymlogger/workout/infrastructure/workout_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final workoutServiceProvider = Provider(
  (ref) => WorkoutService(dio),
);

final workoutRepositoryProvider = Provider(
  (ref) => WorkoutRepository(
    ref.watch(workoutServiceProvider),
  ),
);

final workoutStateNotifierProvider =
    StateNotifierProvider<WorkoutStateNotifier, WorkoutRoutineState>(
  (ref) => WorkoutStateNotifier(
    ref.watch(workoutRepositoryProvider),
  ),
);
