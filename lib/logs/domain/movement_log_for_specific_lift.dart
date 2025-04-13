import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gymlogger/logs/domain/lift_logs.dart';

part 'movement_log_for_specific_lift.freezed.dart';
part 'movement_log_for_specific_lift.g.dart';

@freezed
sealed class MovementLogsForSpecificLift with _$MovementLogsForSpecificLift {
  const factory MovementLogsForSpecificLift({
    required String lift,
    required List<LiftLog> logs,
  }) = _MovementLogsForSpecificLift;

  const MovementLogsForSpecificLift._();
  factory MovementLogsForSpecificLift.fromJson(Map<String, Object?> json) =>
      _$MovementLogsForSpecificLiftFromJson(json);
}
