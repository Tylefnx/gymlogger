// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movement_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovementLogs _$MovementLogsFromJson(Map<String, dynamic> json) {
  return _MovementLog.fromJson(json);
}

/// @nodoc
mixin _$MovementLogs {
  List<LiftLog> get logs => throw _privateConstructorUsedError;

  /// Serializes this MovementLogs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovementLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovementLogsCopyWith<MovementLogs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementLogsCopyWith<$Res> {
  factory $MovementLogsCopyWith(
          MovementLogs value, $Res Function(MovementLogs) then) =
      _$MovementLogsCopyWithImpl<$Res, MovementLogs>;
  @useResult
  $Res call({List<LiftLog> logs});
}

/// @nodoc
class _$MovementLogsCopyWithImpl<$Res, $Val extends MovementLogs>
    implements $MovementLogsCopyWith<$Res> {
  _$MovementLogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovementLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LiftLog>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovementLogImplCopyWith<$Res>
    implements $MovementLogsCopyWith<$Res> {
  factory _$$MovementLogImplCopyWith(
          _$MovementLogImpl value, $Res Function(_$MovementLogImpl) then) =
      __$$MovementLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LiftLog> logs});
}

/// @nodoc
class __$$MovementLogImplCopyWithImpl<$Res>
    extends _$MovementLogsCopyWithImpl<$Res, _$MovementLogImpl>
    implements _$$MovementLogImplCopyWith<$Res> {
  __$$MovementLogImplCopyWithImpl(
      _$MovementLogImpl _value, $Res Function(_$MovementLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovementLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_$MovementLogImpl(
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LiftLog>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovementLogImpl extends _MovementLog {
  const _$MovementLogImpl({required final List<LiftLog> logs})
      : _logs = logs,
        super._();

  factory _$MovementLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovementLogImplFromJson(json);

  final List<LiftLog> _logs;
  @override
  List<LiftLog> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  String toString() {
    return 'MovementLogs(logs: $logs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovementLogImpl &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_logs));

  /// Create a copy of MovementLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovementLogImplCopyWith<_$MovementLogImpl> get copyWith =>
      __$$MovementLogImplCopyWithImpl<_$MovementLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovementLogImplToJson(
      this,
    );
  }
}

abstract class _MovementLog extends MovementLogs {
  const factory _MovementLog({required final List<LiftLog> logs}) =
      _$MovementLogImpl;
  const _MovementLog._() : super._();

  factory _MovementLog.fromJson(Map<String, dynamic> json) =
      _$MovementLogImpl.fromJson;

  @override
  List<LiftLog> get logs;

  /// Create a copy of MovementLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovementLogImplCopyWith<_$MovementLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
