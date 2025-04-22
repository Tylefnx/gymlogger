import 'package:gymlogger/core/shared/dio.dart';
import 'package:gymlogger/logs/application/movements_notifier.dart';
import 'package:gymlogger/logs/application/predictions_state_notifier.dart';
import 'package:gymlogger/logs/infrastructure/movement_repository.dart';
import 'package:gymlogger/logs/infrastructure/movement_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movementsServiceProvider = Provider(
  (ref) => MovementLogsService(dio),
);

final movementsRepoProvider = Provider(
  (ref) => MovementLogsRepository(
    ref.watch(movementsServiceProvider),
  ),
);

final movementsStateNotifierProvider =
    StateNotifierProvider<MovementsStateNotifier, MovementsState>(
  (ref) => MovementsStateNotifier(
    ref.watch(movementsRepoProvider),
  ),
);

final predictionsStateNotifierProvider =
    StateNotifierProvider<PredictionsStateNotifier, PredictionsState>(
  (ref) => PredictionsStateNotifier(
    ref.watch(movementsRepoProvider),
  ),
);
