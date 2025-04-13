import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine.freezed.dart';
part 'routine.g.dart';

@freezed
class Routine with _$Routine {
  const factory Routine({
    @JsonKey(name: 'routine_name') required String routineName,
    required Map<String, List<int>> exercises,
  }) = _Routine;

  factory Routine.fromJson(Map<String, Object?> json) =>
      _$RoutineFromJson(json);
}
