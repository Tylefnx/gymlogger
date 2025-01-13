import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gymlogger/logs/domain/movement_log.dart';

part 'lift_logs.freezed.dart';
part 'lift_logs.g.dart';

@freezed
class LiftLogs with _$LiftLogs {
  const factory LiftLogs({
    MovementLog? squat,
    MovementLog? bench,
    MovementLog? deadlift,
    MovementLog? ohp,
  }) = _MovementsLogs;
  const LiftLogs._();
  factory LiftLogs.fromJson(Map<String, Object?> json) =>
      _$LiftLogsFromJson(json);
}
