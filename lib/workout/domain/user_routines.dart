import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gymlogger/workout/domain/routine.dart';

part 'user_routines.freezed.dart';
part 'user_routines.g.dart';

@Freezed()
class UserRoutines with _$UserRoutines {
  const factory UserRoutines({
    required List<Routine> routines,
  }) = _UserRoutines;

  factory UserRoutines.fromJson(Map<String, Object?> json) =>
      _$UserRoutinesFromJson(json);
}
