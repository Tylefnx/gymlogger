import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/logs/domain/predictions.dart';
import 'package:gymlogger/logs/infrastructure/movement_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'predictions_state_notifier.freezed.dart';

@freezed
class PredictionsState with _$PredictionsState {
  const PredictionsState._();
  const factory PredictionsState.loading() = _Loading;
  const factory PredictionsState.failed(AuthFailure? failure) = _Failed;
  const factory PredictionsState.loaded({
    required Predictions predictions,
  }) = _Loaded;
}

class PredictionsStateNotifier extends StateNotifier<PredictionsState> {
  final MovementLogsRepository _repository;
  PredictionsStateNotifier(this._repository)
      : super(const PredictionsState.failed(null));

  Future<void> getPredictions({
    required String username,
    required String exercise,
    required String token,
  }) async {
    state = const PredictionsState.loading();
    final saveOrFailure = await _repository.getPredictions(
      username: username,
      exercise: exercise,
      token: token,
    );
    state = saveOrFailure.fold(
      (l) => PredictionsState.failed(l),
      (r) => PredictionsState.loaded(predictions: r),
    );

    print(state);
  }
}
