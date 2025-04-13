import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gymlogger/logs/domain/lift_logs.dart';

part 'movement_log.freezed.dart';
part 'movement_log.g.dart';

@freezed
class MovementLogs with _$MovementLogs {
  const factory MovementLogs({
    required List<LiftLog> logs,
  }) = _MovementLog;

  const MovementLogs._();
  factory MovementLogs.fromJson(Map<String, Object?> json) =>
      _$MovementLogsFromJson(json);
}
