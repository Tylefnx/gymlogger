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
  return _LiftLogs.fromJson(json);
}

/// @nodoc
mixin _$LiftLogs {
  @JsonKey(name: 'Squat')
  Map<String, dynamic>? get squat => throw _privateConstructorUsedError;
  @JsonKey(name: 'bench press')
  Map<String, dynamic>? get bench => throw _privateConstructorUsedError;
  @JsonKey(name: 'deadlift')
  Map<String, dynamic>? get deadlift => throw _privateConstructorUsedError;
  @JsonKey(name: 'overhead press')
  Map<String, dynamic>? get ohp => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'Squat') Map<String, dynamic>? squat,
      @JsonKey(name: 'bench press') Map<String, dynamic>? bench,
      @JsonKey(name: 'deadlift') Map<String, dynamic>? deadlift,
      @JsonKey(name: 'overhead press') Map<String, dynamic>? ohp});
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
              as Map<String, dynamic>?,
      bench: freezed == bench
          ? _value.bench
          : bench // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      deadlift: freezed == deadlift
          ? _value.deadlift
          : deadlift // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      ohp: freezed == ohp
          ? _value.ohp
          : ohp // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiftLogsImplCopyWith<$Res>
    implements $LiftLogsCopyWith<$Res> {
  factory _$$LiftLogsImplCopyWith(
          _$LiftLogsImpl value, $Res Function(_$LiftLogsImpl) then) =
      __$$LiftLogsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Squat') Map<String, dynamic>? squat,
      @JsonKey(name: 'bench press') Map<String, dynamic>? bench,
      @JsonKey(name: 'deadlift') Map<String, dynamic>? deadlift,
      @JsonKey(name: 'overhead press') Map<String, dynamic>? ohp});
}

/// @nodoc
class __$$LiftLogsImplCopyWithImpl<$Res>
    extends _$LiftLogsCopyWithImpl<$Res, _$LiftLogsImpl>
    implements _$$LiftLogsImplCopyWith<$Res> {
  __$$LiftLogsImplCopyWithImpl(
      _$LiftLogsImpl _value, $Res Function(_$LiftLogsImpl) _then)
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
    return _then(_$LiftLogsImpl(
      squat: freezed == squat
          ? _value._squat
          : squat // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      bench: freezed == bench
          ? _value._bench
          : bench // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      deadlift: freezed == deadlift
          ? _value._deadlift
          : deadlift // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      ohp: freezed == ohp
          ? _value._ohp
          : ohp // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiftLogsImpl extends _LiftLogs {
  const _$LiftLogsImpl(
      {@JsonKey(name: 'Squat') final Map<String, dynamic>? squat,
      @JsonKey(name: 'bench press') final Map<String, dynamic>? bench,
      @JsonKey(name: 'deadlift') final Map<String, dynamic>? deadlift,
      @JsonKey(name: 'overhead press') final Map<String, dynamic>? ohp})
      : _squat = squat,
        _bench = bench,
        _deadlift = deadlift,
        _ohp = ohp,
        super._();

  factory _$LiftLogsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiftLogsImplFromJson(json);

  final Map<String, dynamic>? _squat;
  @override
  @JsonKey(name: 'Squat')
  Map<String, dynamic>? get squat {
    final value = _squat;
    if (value == null) return null;
    if (_squat is EqualUnmodifiableMapView) return _squat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _bench;
  @override
  @JsonKey(name: 'bench press')
  Map<String, dynamic>? get bench {
    final value = _bench;
    if (value == null) return null;
    if (_bench is EqualUnmodifiableMapView) return _bench;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _deadlift;
  @override
  @JsonKey(name: 'deadlift')
  Map<String, dynamic>? get deadlift {
    final value = _deadlift;
    if (value == null) return null;
    if (_deadlift is EqualUnmodifiableMapView) return _deadlift;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _ohp;
  @override
  @JsonKey(name: 'overhead press')
  Map<String, dynamic>? get ohp {
    final value = _ohp;
    if (value == null) return null;
    if (_ohp is EqualUnmodifiableMapView) return _ohp;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'LiftLogs(squat: $squat, bench: $bench, deadlift: $deadlift, ohp: $ohp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiftLogsImpl &&
            const DeepCollectionEquality().equals(other._squat, _squat) &&
            const DeepCollectionEquality().equals(other._bench, _bench) &&
            const DeepCollectionEquality().equals(other._deadlift, _deadlift) &&
            const DeepCollectionEquality().equals(other._ohp, _ohp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_squat),
      const DeepCollectionEquality().hash(_bench),
      const DeepCollectionEquality().hash(_deadlift),
      const DeepCollectionEquality().hash(_ohp));

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiftLogsImplCopyWith<_$LiftLogsImpl> get copyWith =>
      __$$LiftLogsImplCopyWithImpl<_$LiftLogsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiftLogsImplToJson(
      this,
    );
  }
}

abstract class _LiftLogs extends LiftLogs {
  const factory _LiftLogs(
          {@JsonKey(name: 'Squat') final Map<String, dynamic>? squat,
          @JsonKey(name: 'bench press') final Map<String, dynamic>? bench,
          @JsonKey(name: 'deadlift') final Map<String, dynamic>? deadlift,
          @JsonKey(name: 'overhead press') final Map<String, dynamic>? ohp}) =
      _$LiftLogsImpl;
  const _LiftLogs._() : super._();

  factory _LiftLogs.fromJson(Map<String, dynamic> json) =
      _$LiftLogsImpl.fromJson;

  @override
  @JsonKey(name: 'Squat')
  Map<String, dynamic>? get squat;
  @override
  @JsonKey(name: 'bench press')
  Map<String, dynamic>? get bench;
  @override
  @JsonKey(name: 'deadlift')
  Map<String, dynamic>? get deadlift;
  @override
  @JsonKey(name: 'overhead press')
  Map<String, dynamic>? get ohp;

  /// Create a copy of LiftLogs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiftLogsImplCopyWith<_$LiftLogsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
