// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_routines.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRoutines _$UserRoutinesFromJson(Map<String, dynamic> json) {
  return _UserRoutines.fromJson(json);
}

/// @nodoc
mixin _$UserRoutines {
  List<Routine> get routines => throw _privateConstructorUsedError;

  /// Serializes this UserRoutines to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRoutines
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoutinesCopyWith<UserRoutines> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoutinesCopyWith<$Res> {
  factory $UserRoutinesCopyWith(
          UserRoutines value, $Res Function(UserRoutines) then) =
      _$UserRoutinesCopyWithImpl<$Res, UserRoutines>;
  @useResult
  $Res call({List<Routine> routines});
}

/// @nodoc
class _$UserRoutinesCopyWithImpl<$Res, $Val extends UserRoutines>
    implements $UserRoutinesCopyWith<$Res> {
  _$UserRoutinesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRoutines
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routines = null,
  }) {
    return _then(_value.copyWith(
      routines: null == routines
          ? _value.routines
          : routines // ignore: cast_nullable_to_non_nullable
              as List<Routine>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoutinesImplCopyWith<$Res>
    implements $UserRoutinesCopyWith<$Res> {
  factory _$$UserRoutinesImplCopyWith(
          _$UserRoutinesImpl value, $Res Function(_$UserRoutinesImpl) then) =
      __$$UserRoutinesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Routine> routines});
}

/// @nodoc
class __$$UserRoutinesImplCopyWithImpl<$Res>
    extends _$UserRoutinesCopyWithImpl<$Res, _$UserRoutinesImpl>
    implements _$$UserRoutinesImplCopyWith<$Res> {
  __$$UserRoutinesImplCopyWithImpl(
      _$UserRoutinesImpl _value, $Res Function(_$UserRoutinesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRoutines
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routines = null,
  }) {
    return _then(_$UserRoutinesImpl(
      routines: null == routines
          ? _value._routines
          : routines // ignore: cast_nullable_to_non_nullable
              as List<Routine>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoutinesImpl implements _UserRoutines {
  const _$UserRoutinesImpl({required final List<Routine> routines})
      : _routines = routines;

  factory _$UserRoutinesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoutinesImplFromJson(json);

  final List<Routine> _routines;
  @override
  List<Routine> get routines {
    if (_routines is EqualUnmodifiableListView) return _routines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routines);
  }

  @override
  String toString() {
    return 'UserRoutines(routines: $routines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoutinesImpl &&
            const DeepCollectionEquality().equals(other._routines, _routines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_routines));

  /// Create a copy of UserRoutines
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoutinesImplCopyWith<_$UserRoutinesImpl> get copyWith =>
      __$$UserRoutinesImplCopyWithImpl<_$UserRoutinesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoutinesImplToJson(
      this,
    );
  }
}

abstract class _UserRoutines implements UserRoutines {
  const factory _UserRoutines({required final List<Routine> routines}) =
      _$UserRoutinesImpl;

  factory _UserRoutines.fromJson(Map<String, dynamic> json) =
      _$UserRoutinesImpl.fromJson;

  @override
  List<Routine> get routines;

  /// Create a copy of UserRoutines
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoutinesImplCopyWith<_$UserRoutinesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
