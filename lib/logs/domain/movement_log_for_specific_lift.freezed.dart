// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movement_log_for_specific_lift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovementLogsForSpecificLift _$MovementLogsForSpecificLiftFromJson(
    Map<String, dynamic> json) {
  return _MovementLogsForSpecificLift.fromJson(json);
}

/// @nodoc
mixin _$MovementLogsForSpecificLift {
  String get lift => throw _privateConstructorUsedError;
  List<LiftLog> get logs => throw _privateConstructorUsedError;

  /// Serializes this MovementLogsForSpecificLift to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovementLogsForSpecificLift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovementLogsForSpecificLiftCopyWith<MovementLogsForSpecificLift>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovementLogsForSpecificLiftCopyWith<$Res> {
  factory $MovementLogsForSpecificLiftCopyWith(
          MovementLogsForSpecificLift value,
          $Res Function(MovementLogsForSpecificLift) then) =
      _$MovementLogsForSpecificLiftCopyWithImpl<$Res,
          MovementLogsForSpecificLift>;
  @useResult
  $Res call({String lift, List<LiftLog> logs});
}

/// @nodoc
class _$MovementLogsForSpecificLiftCopyWithImpl<$Res,
        $Val extends MovementLogsForSpecificLift>
    implements $MovementLogsForSpecificLiftCopyWith<$Res> {
  _$MovementLogsForSpecificLiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovementLogsForSpecificLift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lift = null,
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      lift: null == lift
          ? _value.lift
          : lift // ignore: cast_nullable_to_non_nullable
              as String,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LiftLog>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovementLogsForSpecificLiftImplCopyWith<$Res>
    implements $MovementLogsForSpecificLiftCopyWith<$Res> {
  factory _$$MovementLogsForSpecificLiftImplCopyWith(
          _$MovementLogsForSpecificLiftImpl value,
          $Res Function(_$MovementLogsForSpecificLiftImpl) then) =
      __$$MovementLogsForSpecificLiftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lift, List<LiftLog> logs});
}

/// @nodoc
class __$$MovementLogsForSpecificLiftImplCopyWithImpl<$Res>
    extends _$MovementLogsForSpecificLiftCopyWithImpl<$Res,
        _$MovementLogsForSpecificLiftImpl>
    implements _$$MovementLogsForSpecificLiftImplCopyWith<$Res> {
  __$$MovementLogsForSpecificLiftImplCopyWithImpl(
      _$MovementLogsForSpecificLiftImpl _value,
      $Res Function(_$MovementLogsForSpecificLiftImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovementLogsForSpecificLift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lift = null,
    Object? logs = null,
  }) {
    return _then(_$MovementLogsForSpecificLiftImpl(
      lift: null == lift
          ? _value.lift
          : lift // ignore: cast_nullable_to_non_nullable
              as String,
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LiftLog>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovementLogsForSpecificLiftImpl extends _MovementLogsForSpecificLift {
  const _$MovementLogsForSpecificLiftImpl(
      {required this.lift, required final List<LiftLog> logs})
      : _logs = logs,
        super._();

  factory _$MovementLogsForSpecificLiftImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MovementLogsForSpecificLiftImplFromJson(json);

  @override
  final String lift;
  final List<LiftLog> _logs;
  @override
  List<LiftLog> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  String toString() {
    return 'MovementLogsForSpecificLift(lift: $lift, logs: $logs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovementLogsForSpecificLiftImpl &&
            (identical(other.lift, lift) || other.lift == lift) &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, lift, const DeepCollectionEquality().hash(_logs));

  /// Create a copy of MovementLogsForSpecificLift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovementLogsForSpecificLiftImplCopyWith<_$MovementLogsForSpecificLiftImpl>
      get copyWith => __$$MovementLogsForSpecificLiftImplCopyWithImpl<
          _$MovementLogsForSpecificLiftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovementLogsForSpecificLiftImplToJson(
      this,
    );
  }
}

abstract class _MovementLogsForSpecificLift
    extends MovementLogsForSpecificLift {
  const factory _MovementLogsForSpecificLift(
      {required final String lift,
      required final List<LiftLog> logs}) = _$MovementLogsForSpecificLiftImpl;
  const _MovementLogsForSpecificLift._() : super._();

  factory _MovementLogsForSpecificLift.fromJson(Map<String, dynamic> json) =
      _$MovementLogsForSpecificLiftImpl.fromJson;

  @override
  String get lift;
  @override
  List<LiftLog> get logs;

  /// Create a copy of MovementLogsForSpecificLift
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovementLogsForSpecificLiftImplCopyWith<_$MovementLogsForSpecificLiftImpl>
      get copyWith => throw _privateConstructorUsedError;
}
