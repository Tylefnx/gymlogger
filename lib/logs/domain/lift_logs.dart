import 'package:freezed_annotation/freezed_annotation.dart';

part 'lift_logs.freezed.dart';
part 'lift_logs.g.dart';

@freezed
class LiftLogs with _$LiftLogs {
  const factory LiftLogs({
    @JsonKey(name: 'Squat') Map<String, double>? squat,
    @JsonKey(name: 'bench press') Map<String, double>? bench,
    @JsonKey(name: 'deadlift') Map<String, double>? deadlift,
    @JsonKey(name: 'overhead press') Map<String, double>? ohp,
  }) = _LiftLogs;
  const LiftLogs._();

  factory LiftLogs.fromJson(Map<String, Object?> json) =>
      _$LiftLogsFromJson(json);
}
