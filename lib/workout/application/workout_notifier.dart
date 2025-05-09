import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/workout/domain/user_routines.dart';
import 'package:gymlogger/workout/infrastructure/workout_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'workout_notifier.freezed.dart';

@freezed
class WorkoutRoutineState with _$WorkoutRoutineState {
  const WorkoutRoutineState._();
  const factory WorkoutRoutineState.loading() = _Loading;
  const factory WorkoutRoutineState.failed(AuthFailure? failure) = _Failed;
  const factory WorkoutRoutineState.loaded({required UserRoutines liftLogs}) =
      _Loaded;
}

class WorkoutStateNotifier extends StateNotifier<WorkoutRoutineState> {
  final WorkoutRepository _repository;
  WorkoutStateNotifier(this._repository)
      : super(const WorkoutRoutineState.failed(null));

  Future<void> getWorkoutRoutine({
    required String username,
    required String token,
  }) async {
    state = const WorkoutRoutineState.loading();
    final logsOrFailure = await _repository.getUserRoutine(
      username: username,
      token: token,
    );
    state = logsOrFailure.fold(
      (l) => WorkoutRoutineState.failed(l),
      (r) => WorkoutRoutineState.loaded(liftLogs: r),
    );
  }

  Future<void> updateWorkoutRoutine({
    required String username,
    required String routineName,
    required String token,
    required Map<String, List<int>> exercises,
  }) async {
    state = const WorkoutRoutineState.loading();
    final updateOrFailure = await _repository.updateWorkoutRoutine(
      username: username,
      routineName: routineName,
      token: token,
      exercises: exercises,
    );
    state = await updateOrFailure.fold(
      (l) => WorkoutRoutineState.failed(l),
      (r) => state,
    );
    await getWorkoutRoutine(
      username: username,
      token: token,
    );
  }

  Future<void> saveWorkoutRoutine({
    required String username,
    required String routineName,
    required String token,
    required Map<String, List<int>> exercises,
  }) async {
    state = const WorkoutRoutineState.loading();
    final saveOrFailure = await _repository.saveWorkoutRoutine(
      username: username,
      routineName: routineName,
      exercises: exercises,
      token: token,
    );
    state =
        saveOrFailure.fold((l) => WorkoutRoutineState.failed(l), (r) => state);
    await getWorkoutRoutine(
      username: username,
      token: token,
    );
  }

  Future<void> deleteWorkoutRoutine({
    required String username,
    required String routineName,
    required String token,
    required Map<String, List<int>> exercises,
  }) async {
    state = const WorkoutRoutineState.loading();
    final saveOrFailure = await _repository.deleteWorkoutRoutine(
      username: username,
      routineName: routineName,
      token: token,
    );
    state =
        saveOrFailure.fold((l) => WorkoutRoutineState.failed(l), (r) => state);
    await getWorkoutRoutine(
      username: username,
      token: token,
    );
  }
}
