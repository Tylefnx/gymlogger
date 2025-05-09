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

LiftLog _$LiftLogFromJson(Map<String, dynamic> json) {
  return _LiftLog.fromJson(json);
}

/// @nodoc
mixin _$LiftLog {
  String get exercise => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  double get bodyweight => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;

  /// Serializes this LiftLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiftLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiftLogCopyWith<LiftLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiftLogCopyWith<$Res> {
  factory $LiftLogCopyWith(LiftLog value, $Res Function(LiftLog) then) =
      _$LiftLogCopyWithImpl<$Res, LiftLog>;
  @useResult
  $Res call(
      {String exercise,
      int age,
      double bodyweight,
      String date,
      String sex,
      double weight});
}

/// @nodoc
class _$LiftLogCopyWithImpl<$Res, $Val extends LiftLog>
    implements $LiftLogCopyWith<$Res> {
  _$LiftLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiftLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? age = null,
    Object? bodyweight = null,
    Object? date = null,
    Object? sex = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      bodyweight: null == bodyweight
          ? _value.bodyweight
          : bodyweight // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiftLogImplCopyWith<$Res> implements $LiftLogCopyWith<$Res> {
  factory _$$LiftLogImplCopyWith(
          _$LiftLogImpl value, $Res Function(_$LiftLogImpl) then) =
      __$$LiftLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exercise,
      int age,
      double bodyweight,
      String date,
      String sex,
      double weight});
}

/// @nodoc
class __$$LiftLogImplCopyWithImpl<$Res>
    extends _$LiftLogCopyWithImpl<$Res, _$LiftLogImpl>
    implements _$$LiftLogImplCopyWith<$Res> {
  __$$LiftLogImplCopyWithImpl(
      _$LiftLogImpl _value, $Res Function(_$LiftLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiftLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? age = null,
    Object? bodyweight = null,
    Object? date = null,
    Object? sex = null,
    Object? weight = null,
  }) {
    return _then(_$LiftLogImpl(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      bodyweight: null == bodyweight
          ? _value.bodyweight
          : bodyweight // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LiftLogImpl extends _LiftLog {
  const _$LiftLogImpl(
      {required this.exercise,
      required this.age,
      required this.bodyweight,
      required this.date,
      required this.sex,
      required this.weight})
      : super._();

  factory _$LiftLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiftLogImplFromJson(json);

  @override
  final String exercise;
  @override
  final int age;
  @override
  final double bodyweight;
  @override
  final String date;
  @override
  final String sex;
  @override
  final double weight;

  @override
  String toString() {
    return 'LiftLog(exercise: $exercise, age: $age, bodyweight: $bodyweight, date: $date, sex: $sex, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiftLogImpl &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.bodyweight, bodyweight) ||
                other.bodyweight == bodyweight) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exercise, age, bodyweight, date, sex, weight);

  /// Create a copy of LiftLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiftLogImplCopyWith<_$LiftLogImpl> get copyWith =>
      __$$LiftLogImplCopyWithImpl<_$LiftLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiftLogImplToJson(
      this,
    );
  }
}

abstract class _LiftLog extends LiftLog {
  const factory _LiftLog(
      {required final String exercise,
      required final int age,
      required final double bodyweight,
      required final String date,
      required final String sex,
      required final double weight}) = _$LiftLogImpl;
  const _LiftLog._() : super._();

  factory _LiftLog.fromJson(Map<String, dynamic> json) = _$LiftLogImpl.fromJson;

  @override
  String get exercise;
  @override
  int get age;
  @override
  double get bodyweight;
  @override
  String get date;
  @override
  String get sex;
  @override
  double get weight;

  /// Create a copy of LiftLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiftLogImplCopyWith<_$LiftLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
