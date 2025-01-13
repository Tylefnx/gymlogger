// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lift_logs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiftLogs _$LiftLogsFromJson(Map<String, dynamic> json) {
  return _MovementsLogs.fromJson(json);
}

/// @nodoc
mixin _$LiftLogs {
  MovementLog? get squat => throw _privateConstructorUsedError;
  MovementLog? get bench => throw _privateConstructorUsedError;
  MovementLog? get deadlift => throw _privateConstructorUsedError;
  MovementLog? get ohp => throw _privateConstructorUsedError;

  /// Serializes this LiftLogs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiftLogsCopyWith<LiftLogs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiftLogsCopyWith<$Res> {
  factory $LiftLogsCopyWith(LiftLogs value, $Res Function(LiftLogs) then) =
      _$LiftLogsCopyWithImpl<$Res, LiftLogs>;
  @useResult
  $Res call(
      {MovementLog? squat,
      MovementLog? bench,
      MovementLog? deadlift,
      MovementLog? ohp});

  $MovementLogCopyWith<$Res>? get squat;
  $MovementLogCopyWith<$Res>? get bench;
  $MovementLogCopyWith<$Res>? get deadlift;
  $MovementLogCopyWith<$Res>? get ohp;
}

/// @nodoc
class _$LiftLogsCopyWithImpl<$Res, $Val extends LiftLogs>
    implements $LiftLogsCopyWith<$Res> {
  _$LiftLogsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? squat = freezed,
    Object? bench = freezed,
    Object? deadlift = freezed,
    Object? ohp = freezed,
  }) {
    return _then(_value.copyWith(
      squat: freezed == squat
          ? _value.squat
          : squat // ignore: cast_nullable_to_non_nullable
              as MovementLog?,
      bench: freezed == bench
          ? _value.bench
          : bench // ignore: cast_nullable_to_non_nullable
              as MovementLog?,
      deadlift: freezed == deadlift
          ? _value.deadlift
          : deadlift // ignore: cast_nullable_to_non_nullable
              as MovementLog?,
      ohp: freezed == ohp
          ? _value.ohp
          : ohp // ignore: cast_nullable_to_non_nullable
              as MovementLog?,
    ) as $Val);
  }

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovementLogCopyWith<$Res>? get squat {
    if (_value.squat == null) {
      return null;
    }

    return $MovementLogCopyWith<$Res>(_value.squat!, (value) {
      return _then(_value.copyWith(squat: value) as $Val);
    });
  }

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovementLogCopyWith<$Res>? get bench {
    if (_value.bench == null) {
      return null;
    }

    return $MovementLogCopyWith<$Res>(_value.bench!, (value) {
      return _then(_value.copyWith(bench: value) as $Val);
    });
  }

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovementLogCopyWith<$Res>? get deadlift {
    if (_value.deadlift == null) {
      return null;
    }

    return $MovementLogCopyWith<$Res>(_value.deadlift!, (value) {
      return _then(_value.copyWith(deadlift: value) as $Val);
    });
  }

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovementLogCopyWith<$Res>? get ohp {
    if (_value.ohp == null) {
      return null;
    }

    return $MovementLogCopyWith<$Res>(_value.ohp!, (value) {
      return _then(_value.copyWith(ohp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovementsLogsImplCopyWith<$Res>
    implements $LiftLogsCopyWith<$Res> {
  factory _$$MovementsLogsImplCopyWith(
          _$MovementsLogsImpl value, $Res Function(_$MovementsLogsImpl) then) =
      __$$MovementsLogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MovementLog? squat,
      MovementLog? bench,
      MovementLog? deadlift,
      MovementLog? ohp});

  @override
  $MovementLogCopyWith<$Res>? get squat;
  @override
  $MovementLogCopyWith<$Res>? get bench;
  @override
  $MovementLogCopyWith<$Res>? get deadlift;
  @override
  $MovementLogCopyWith<$Res>? get ohp;
}

/// @nodoc
class __$$MovementsLogsImplCopyWithImpl<$Res>
    extends _$LiftLogsCopyWithImpl<$Res, _$MovementsLogsImpl>
    implements _$$MovementsLogsImplCopyWith<$Res> {
  __$$MovementsLogsImplCopyWithImpl(
      _$MovementsLogsImpl _value, $Res Function(_$MovementsLogsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? squat = freezed,
    Object? bench = freezed,
    Object? deadlift = freezed,
    Object? ohp = freezed,
  }) {
    return _then(_$MovementsLogsImpl(
      squat: freezed == squat
          ? _value.squat
          : squat // ignore: cast_nullable_to_non_nullable
              as MovementLog?,
      bench: freezed == bench
          ? _value.bench
          : bench // ignore: cast_nullable_to_non_nullable
              as MovementLog?,
      deadlift: freezed == deadlift
          ? _value.deadlift
          : deadlift // ignore: cast_nullable_to_non_nullable
              as MovementLog?,
      ohp: freezed == ohp
          ? _value.ohp
          : ohp // ignore: cast_nullable_to_non_nullable
              as MovementLog?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovementsLogsImpl extends _MovementsLogs {
  const _$MovementsLogsImpl({this.squat, this.bench, this.deadlift, this.ohp})
      : super._();

  factory _$MovementsLogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovementsLogsImplFromJson(json);

  @override
  final MovementLog? squat;
  @override
  final MovementLog? bench;
  @override
  final MovementLog? deadlift;
  @override
  final MovementLog? ohp;

  @override
  String toString() {
    return 'LiftLogs(squat: $squat, bench: $bench, deadlift: $deadlift, ohp: $ohp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovementsLogsImpl &&
            (identical(other.squat, squat) || other.squat == squat) &&
            (identical(other.bench, bench) || other.bench == bench) &&
            (identical(other.deadlift, deadlift) ||
                other.deadlift == deadlift) &&
            (identical(other.ohp, ohp) || other.ohp == ohp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, squat, bench, deadlift, ohp);

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovementsLogsImplCopyWith<_$MovementsLogsImpl> get copyWith =>
      __$$MovementsLogsImplCopyWithImpl<_$MovementsLogsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovementsLogsImplToJson(
      this,
    );
  }
}

abstract class _MovementsLogs extends LiftLogs {
  const factory _MovementsLogs(
      {final MovementLog? squat,
      final MovementLog? bench,
      final MovementLog? deadlift,
      final MovementLog? ohp}) = _$MovementsLogsImpl;
  const _MovementsLogs._() : super._();

  factory _MovementsLogs.fromJson(Map<String, dynamic> json) =
      _$MovementsLogsImpl.fromJson;

  @override
  MovementLog? get squat;
  @override
  MovementLog? get bench;
  @override
  MovementLog? get deadlift;
  @override
  MovementLog? get ohp;

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovementsLogsImplCopyWith<_$MovementsLogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
