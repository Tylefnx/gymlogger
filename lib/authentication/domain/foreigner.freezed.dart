// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'foreigner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Foreigner _$ForeignerFromJson(Map<String, dynamic> json) {
  return _Foreigner.fromJson(json);
}

/// @nodoc
mixin _$Foreigner {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  bool get isFriend => throw _privateConstructorUsedError;

  /// Serializes this Foreigner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Foreigner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForeignerCopyWith<Foreigner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForeignerCopyWith<$Res> {
  factory $ForeignerCopyWith(Foreigner value, $Res Function(Foreigner) then) =
      _$ForeignerCopyWithImpl<$Res, Foreigner>;
  @useResult
  $Res call({int id, String username, bool isOnline, bool isFriend});
}

/// @nodoc
class _$ForeignerCopyWithImpl<$Res, $Val extends Foreigner>
    implements $ForeignerCopyWith<$Res> {
  _$ForeignerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Foreigner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? isOnline = null,
    Object? isFriend = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForeignerImplCopyWith<$Res>
    implements $ForeignerCopyWith<$Res> {
  factory _$$ForeignerImplCopyWith(
          _$ForeignerImpl value, $Res Function(_$ForeignerImpl) then) =
      __$$ForeignerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String username, bool isOnline, bool isFriend});
}

/// @nodoc
class __$$ForeignerImplCopyWithImpl<$Res>
    extends _$ForeignerCopyWithImpl<$Res, _$ForeignerImpl>
    implements _$$ForeignerImplCopyWith<$Res> {
  __$$ForeignerImplCopyWithImpl(
      _$ForeignerImpl _value, $Res Function(_$ForeignerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Foreigner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? isOnline = null,
    Object? isFriend = null,
  }) {
    return _then(_$ForeignerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForeignerImpl implements _Foreigner {
  const _$ForeignerImpl(
      {required this.id,
      required this.username,
      required this.isOnline,
      required this.isFriend});

  factory _$ForeignerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForeignerImplFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final bool isOnline;
  @override
  final bool isFriend;

  @override
  String toString() {
    return 'Foreigner(id: $id, username: $username, isOnline: $isOnline, isFriend: $isFriend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForeignerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, isOnline, isFriend);

  /// Create a copy of Foreigner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForeignerImplCopyWith<_$ForeignerImpl> get copyWith =>
      __$$ForeignerImplCopyWithImpl<_$ForeignerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForeignerImplToJson(
      this,
    );
  }
}

abstract class _Foreigner implements Foreigner {
  const factory _Foreigner(
      {required final int id,
      required final String username,
      required final bool isOnline,
      required final bool isFriend}) = _$ForeignerImpl;

  factory _Foreigner.fromJson(Map<String, dynamic> json) =
      _$ForeignerImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  bool get isOnline;
  @override
  bool get isFriend;

  /// Create a copy of Foreigner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForeignerImplCopyWith<_$ForeignerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
