import 'package:freezed_annotation/freezed_annotation.dart';

part 'movement_log.freezed.dart';
part 'movement_log.g.dart';

@freezed
class MovementLog with _$MovementLog {
  const factory MovementLog({
    required String title,
    required Map<String, double> logs,
  }) = _MovementLog;

  const MovementLog._();
  factory MovementLog.fromJson(Map<String, Object?> json) =>
      _$MovementLogFromJson(json);
}
