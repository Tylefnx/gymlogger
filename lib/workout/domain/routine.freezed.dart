// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Routine _$RoutineFromJson(Map<String, dynamic> json) {
  return _Routine.fromJson(json);
}

/// @nodoc
mixin _$Routine {
  @JsonKey(name: 'routine_name')
  String get routineName => throw _privateConstructorUsedError;
  Map<String, List<int>> get exercises => throw _privateConstructorUsedError;

  /// Serializes this Routine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Routine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoutineCopyWith<Routine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineCopyWith<$Res> {
  factory $RoutineCopyWith(Routine value, $Res Function(Routine) then) =
      _$RoutineCopyWithImpl<$Res, Routine>;
  @useResult
  $Res call(
      {@JsonKey(name: 'routine_name') String routineName,
      Map<String, List<int>> exercises});
}

/// @nodoc
class _$RoutineCopyWithImpl<$Res, $Val extends Routine>
    implements $RoutineCopyWith<$Res> {
  _$RoutineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Routine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routineName = null,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      routineName: null == routineName
          ? _value.routineName
          : routineName // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutineImplCopyWith<$Res> implements $RoutineCopyWith<$Res> {
  factory _$$RoutineImplCopyWith(
          _$RoutineImpl value, $Res Function(_$RoutineImpl) then) =
      __$$RoutineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'routine_name') String routineName,
      Map<String, List<int>> exercises});
}

/// @nodoc
class __$$RoutineImplCopyWithImpl<$Res>
    extends _$RoutineCopyWithImpl<$Res, _$RoutineImpl>
    implements _$$RoutineImplCopyWith<$Res> {
  __$$RoutineImplCopyWithImpl(
      _$RoutineImpl _value, $Res Function(_$RoutineImpl) _then)
      : super(_value, _then);

  /// Create a copy of Routine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routineName = null,
    Object? exercises = null,
  }) {
    return _then(_$RoutineImpl(
      routineName: null == routineName
          ? _value.routineName
          : routineName // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoutineImpl implements _Routine {
  const _$RoutineImpl(
      {@JsonKey(name: 'routine_name') required this.routineName,
      required final Map<String, List<int>> exercises})
      : _exercises = exercises;

  factory _$RoutineImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutineImplFromJson(json);

  @override
  @JsonKey(name: 'routine_name')
  final String routineName;
  final Map<String, List<int>> _exercises;
  @override
  Map<String, List<int>> get exercises {
    if (_exercises is EqualUnmodifiableMapView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_exercises);
  }

  @override
  String toString() {
    return 'Routine(routineName: $routineName, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutineImpl &&
            (identical(other.routineName, routineName) ||
                other.routineName == routineName) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, routineName,
      const DeepCollectionEquality().hash(_exercises));

  /// Create a copy of Routine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutineImplCopyWith<_$RoutineImpl> get copyWith =>
      __$$RoutineImplCopyWithImpl<_$RoutineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoutineImplToJson(
      this,
    );
  }
}

abstract class _Routine implements Routine {
  const factory _Routine(
      {@JsonKey(name: 'routine_name') required final String routineName,
      required final Map<String, List<int>> exercises}) = _$RoutineImpl;

  factory _Routine.fromJson(Map<String, dynamic> json) = _$RoutineImpl.fromJson;

  @override
  @JsonKey(name: 'routine_name')
  String get routineName;
  @override
  Map<String, List<int>> get exercises;

  /// Create a copy of Routine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutineImplCopyWith<_$RoutineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
