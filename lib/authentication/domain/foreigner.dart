import 'package:freezed_annotation/freezed_annotation.dart';

part 'foreigner.freezed.dart';
part 'foreigner.g.dart';

@freezed
class Foreigner with _$Foreigner {
  const factory Foreigner({
    required int id,
    required String username,
    required bool isOnline,
    required bool isFriend,
  }) = _Foreigner;

  factory Foreigner.fromJson(Map<String, Object?> json) =>
      _$ForeignerFromJson(json);
}
