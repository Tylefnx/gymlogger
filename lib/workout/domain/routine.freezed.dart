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
  Map<String, List<int>> get routine => throw _privateConstructorUsedError;

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
  $Res call({Map<String, List<int>> routine});
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
    Object? routine = null,
  }) {
    return _then(_value.copyWith(
      routine: null == routine
          ? _value.routine
          : routine // ignore: cast_nullable_to_non_nullable
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
  $Res call({Map<String, List<int>> routine});
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
    Object? routine = null,
  }) {
    return _then(_$RoutineImpl(
      routine: null == routine
          ? _value._routine
          : routine // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoutineImpl implements _Routine {
  const _$RoutineImpl({required final Map<String, List<int>> routine})
      : _routine = routine;

  factory _$RoutineImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutineImplFromJson(json);

  final Map<String, List<int>> _routine;
  @override
  Map<String, List<int>> get routine {
    if (_routine is EqualUnmodifiableMapView) return _routine;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_routine);
  }

  @override
  String toString() {
    return 'Routine(routine: $routine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutineImpl &&
            const DeepCollectionEquality().equals(other._routine, _routine));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_routine));

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
  const factory _Routine({required final Map<String, List<int>> routine}) =
      _$RoutineImpl;

  factory _Routine.fromJson(Map<String, dynamic> json) = _$RoutineImpl.fromJson;

  @override
  Map<String, List<int>> get routine;

  /// Create a copy of Routine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutineImplCopyWith<_$RoutineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
