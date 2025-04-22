import 'package:freezed_annotation/freezed_annotation.dart';

part 'predictions.freezed.dart';
part 'predictions.g.dart';

@freezed
class Predictions with _$Predictions {
  const factory Predictions({
    required List<double> prediction,
  }) = _Predictions;
  const Predictions._();

  factory Predictions.fromJson(Map<String, Object?> json) =>
      _$PredictionsFromJson(json);
}
