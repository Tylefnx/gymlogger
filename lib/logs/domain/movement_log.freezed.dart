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

MovementLog _$MovementLogFromJson(Map<String, dynamic> json) {
  return _MovementLog.fromJson(json);
}

/// @nodoc
mixin _$MovementLog {
  String get title => throw _privateConstructorUsedError;
  Map<String, double> get logs => throw _privateConstructorUsedError;

  /// Serializes this MovementLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovementLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovementLogCopyWith<MovementLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementLogCopyWith<$Res> {
  factory $MovementLogCopyWith(
          MovementLog value, $Res Function(MovementLog) then) =
      _$MovementLogCopyWithImpl<$Res, MovementLog>;
  @useResult
  $Res call({String title, Map<String, double> logs});
}

/// @nodoc
class _$MovementLogCopyWithImpl<$Res, $Val extends MovementLog>
    implements $MovementLogCopyWith<$Res> {
  _$MovementLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovementLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovementLogImplCopyWith<$Res>
    implements $MovementLogCopyWith<$Res> {
  factory _$$MovementLogImplCopyWith(
          _$MovementLogImpl value, $Res Function(_$MovementLogImpl) then) =
      __$$MovementLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, Map<String, double> logs});
}

/// @nodoc
class __$$MovementLogImplCopyWithImpl<$Res>
    extends _$MovementLogCopyWithImpl<$Res, _$MovementLogImpl>
    implements _$$MovementLogImplCopyWith<$Res> {
  __$$MovementLogImplCopyWithImpl(
      _$MovementLogImpl _value, $Res Function(_$MovementLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovementLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? logs = null,
  }) {
    return _then(_$MovementLogImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovementLogImpl extends _MovementLog {
  const _$MovementLogImpl(
      {required this.title, required final Map<String, double> logs})
      : _logs = logs,
        super._();

  factory _$MovementLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovementLogImplFromJson(json);

  @override
  final String title;
  final Map<String, double> _logs;
  @override
  Map<String, double> get logs {
    if (_logs is EqualUnmodifiableMapView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_logs);
  }

  @override
  String toString() {
    return 'MovementLog(title: $title, logs: $logs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovementLogImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_logs));

  /// Create a copy of MovementLog
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

abstract class _MovementLog extends MovementLog {
  const factory _MovementLog(
      {required final String title,
      required final Map<String, double> logs}) = _$MovementLogImpl;
  const _MovementLog._() : super._();

  factory _MovementLog.fromJson(Map<String, dynamic> json) =
      _$MovementLogImpl.fromJson;

  @override
  String get title;
  @override
  Map<String, double> get logs;

  /// Create a copy of MovementLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovementLogImplCopyWith<_$MovementLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
