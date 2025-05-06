import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/logs/domain/movement_log.dart';
import 'package:gymlogger/logs/infrastructure/movement_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'movements_notifier.freezed.dart';

@freezed
class MovementsState with _$MovementsState {
  const MovementsState._();
  const factory MovementsState.loading() = _Loading;
  const factory MovementsState.failed(AuthFailure? failure) = _Failed;
  const factory MovementsState.loaded({
    required MovementLogs movementLogs,
  }) = _Loaded;
}

class MovementsStateNotifier extends StateNotifier<MovementsState> {
  final MovementLogsRepository _repository;
  MovementsStateNotifier(this._repository)
      : super(const MovementsState.failed(null));

  Future<void> getUserLifts({
    required String username,
    required String token,
  }) async {
    state = const MovementsState.loading();
    final logsOrFailure = await _repository.getUserLifts(
      username: username,
      token: token,
    );
    state = logsOrFailure.fold(
      (l) => MovementsState.failed(l),
      (r) => MovementsState.loaded(movementLogs: r),
    );
  }

  Future<void> updateUserLifts({
    required String username,
    required String exercize,
    required String date,
    required double weight,
    required String token,
  }) async {
    state = const MovementsState.loading();
    final updateOrFailure = await _repository.updateUserLifts(
      username: username,
      exercize: exercize,
      date: date,
      weight: weight,
      token: token,
    );
    state = await updateOrFailure.fold(
      (l) => MovementsState.failed(l),
      (r) => state,
    );
    await getUserLifts(
      username: username,
      token: token,
    );
  }

  Future<void> saveUserLifts({
    required String username,
    required String exercize,
    required String date,
    required double weight,
    required double bodyWeight,
    required String sex,
    required int age,
    required String token,
  }) async {
    state = const MovementsState.loading();
    final saveOrFailure = await _repository.saveUserLifts(
      username: username,
      exercize: exercize,
      date: date,
      weight: weight,
      token: token,
    );
    state = saveOrFailure.fold((l) => MovementsState.failed(l), (r) => state);
    await getUserLifts(
      username: username,
      token: token,
    );
  }

  Future<void> deleteUserLifts({
    required String username,
    required String exercize,
    required String token,
    required String date,
    required double weight,
  }) async {
    state = const MovementsState.loading();
    final saveOrFailure = await _repository.deleteUserLifts(
      username: username,
      exercize: exercize,
      date: date,
      token: token,
    );
    state = saveOrFailure.fold((l) => MovementsState.failed(l), (r) => state);
    await getUserLifts(
      username: username,
      token: token,
    );
  }

  Future<void> getPredictions({
    required String username,
    required String exercise,
    required String token,
  }) async {
    state = const MovementsState.loading();
    final saveOrFailure = await _repository.getPredictions(
      username: username,
      exercise: exercise,
      token: token,
    );
    state = saveOrFailure.fold((l) => MovementsState.failed(l), (r) => state);
    await getUserLifts(
      username: username,
      token: token,
    );
  }
}
