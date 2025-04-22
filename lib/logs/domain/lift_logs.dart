import 'package:freezed_annotation/freezed_annotation.dart';

part 'lift_logs.freezed.dart';
part 'lift_logs.g.dart';

@freezed
class LiftLog with _$LiftLog {
  const factory LiftLog({
    required String exercise,
    required int age,
    required double bodyweight,
    required String date,
    required String sex,
    required double weight,
  }) = _LiftLog;
  const LiftLog._();

  factory LiftLog.fromJson(Map<String, Object?> json) =>
      _$LiftLogFromJson(json);

  factory LiftLog.fromPredictions(
      {required DateTime lastDate,
      required double prediction,
      required String exercise,
      required int age,
      required double bodyWeight,
      required String sex}) {
    return LiftLog(
      exercise: exercise,
      age: age,
      bodyweight: bodyWeight,
      date: lastDate.toString(),
      sex: sex,
      weight: prediction,
    );
  }
}
