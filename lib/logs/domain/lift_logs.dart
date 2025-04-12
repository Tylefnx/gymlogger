import 'package:freezed_annotation/freezed_annotation.dart';

part 'lift_logs.freezed.dart';
part 'lift_logs.g.dart';

@freezed
class LiftLogs with _$LiftLogs {
  const factory LiftLogs({
    @JsonKey(name: 'Squat') Map<String, dynamic>? squat,
    @JsonKey(name: 'bench press') Map<String, dynamic>? bench,
    @JsonKey(name: 'deadlift') Map<String, dynamic>? deadlift,
    @JsonKey(name: 'overhead press') Map<String, dynamic>? ohp,
  }) = _LiftLogs;
  const LiftLogs._();

  factory LiftLogs.fromJson(Map<String, Object?> json) =>
      _$LiftLogsFromJson(json);
}
