// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_schemes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ColorSchemeState {
  ThemeData get themeData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData themeData) light,
    required TResult Function(ThemeData themeData) dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData themeData)? light,
    TResult? Function(ThemeData themeData)? dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData themeData)? light,
    TResult Function(ThemeData themeData)? dark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LightTheme value) light,
    required TResult Function(_DarkTheme value) dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LightTheme value)? light,
    TResult? Function(_DarkTheme value)? dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LightTheme value)? light,
    TResult Function(_DarkTheme value)? dark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ColorSchemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorSchemeStateCopyWith<ColorSchemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorSchemeStateCopyWith<$Res> {
  factory $ColorSchemeStateCopyWith(
          ColorSchemeState value, $Res Function(ColorSchemeState) then) =
      _$ColorSchemeStateCopyWithImpl<$Res, ColorSchemeState>;
  @useResult
  $Res call({ThemeData themeData});
}

/// @nodoc
class _$ColorSchemeStateCopyWithImpl<$Res, $Val extends ColorSchemeState>
    implements $ColorSchemeStateCopyWith<$Res> {
  _$ColorSchemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorSchemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = null,
  }) {
    return _then(_value.copyWith(
      themeData: null == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LightThemeImplCopyWith<$Res>
    implements $ColorSchemeStateCopyWith<$Res> {
  factory _$$LightThemeImplCopyWith(
          _$LightThemeImpl value, $Res Function(_$LightThemeImpl) then) =
      __$$LightThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeData themeData});
}

/// @nodoc
class __$$LightThemeImplCopyWithImpl<$Res>
    extends _$ColorSchemeStateCopyWithImpl<$Res, _$LightThemeImpl>
    implements _$$LightThemeImplCopyWith<$Res> {
  __$$LightThemeImplCopyWithImpl(
      _$LightThemeImpl _value, $Res Function(_$LightThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorSchemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = null,
  }) {
    return _then(_$LightThemeImpl(
      themeData: null == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$LightThemeImpl extends _LightTheme {
  const _$LightThemeImpl({required this.themeData}) : super._();

  @override
  final ThemeData themeData;

  @override
  String toString() {
    return 'ColorSchemeState.light(themeData: $themeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightThemeImpl &&
            (identical(other.themeData, themeData) ||
                other.themeData == themeData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeData);

  /// Create a copy of ColorSchemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightThemeImplCopyWith<_$LightThemeImpl> get copyWith =>
      __$$LightThemeImplCopyWithImpl<_$LightThemeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData themeData) light,
    required TResult Function(ThemeData themeData) dark,
  }) {
    return light(themeData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData themeData)? light,
    TResult? Function(ThemeData themeData)? dark,
  }) {
    return light?.call(themeData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData themeData)? light,
    TResult Function(ThemeData themeData)? dark,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(themeData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LightTheme value) light,
    required TResult Function(_DarkTheme value) dark,
  }) {
    return light(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LightTheme value)? light,
    TResult? Function(_DarkTheme value)? dark,
  }) {
    return light?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LightTheme value)? light,
    TResult Function(_DarkTheme value)? dark,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(this);
    }
    return orElse();
  }
}

abstract class _LightTheme extends ColorSchemeState {
  const factory _LightTheme({required final ThemeData themeData}) =
      _$LightThemeImpl;
  const _LightTheme._() : super._();

  @override
  ThemeData get themeData;

  /// Create a copy of ColorSchemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightThemeImplCopyWith<_$LightThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DarkThemeImplCopyWith<$Res>
    implements $ColorSchemeStateCopyWith<$Res> {
  factory _$$DarkThemeImplCopyWith(
          _$DarkThemeImpl value, $Res Function(_$DarkThemeImpl) then) =
      __$$DarkThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeData themeData});
}

/// @nodoc
class __$$DarkThemeImplCopyWithImpl<$Res>
    extends _$ColorSchemeStateCopyWithImpl<$Res, _$DarkThemeImpl>
    implements _$$DarkThemeImplCopyWith<$Res> {
  __$$DarkThemeImplCopyWithImpl(
      _$DarkThemeImpl _value, $Res Function(_$DarkThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorSchemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = null,
  }) {
    return _then(_$DarkThemeImpl(
      themeData: null == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$DarkThemeImpl extends _DarkTheme {
  const _$DarkThemeImpl({required this.themeData}) : super._();

  @override
  final ThemeData themeData;

  @override
  String toString() {
    return 'ColorSchemeState.dark(themeData: $themeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DarkThemeImpl &&
            (identical(other.themeData, themeData) ||
                other.themeData == themeData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeData);

  /// Create a copy of ColorSchemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DarkThemeImplCopyWith<_$DarkThemeImpl> get copyWith =>
      __$$DarkThemeImplCopyWithImpl<_$DarkThemeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData themeData) light,
    required TResult Function(ThemeData themeData) dark,
  }) {
    return dark(themeData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData themeData)? light,
    TResult? Function(ThemeData themeData)? dark,
  }) {
    return dark?.call(themeData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData themeData)? light,
    TResult Function(ThemeData themeData)? dark,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(themeData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LightTheme value) light,
    required TResult Function(_DarkTheme value) dark,
  }) {
    return dark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LightTheme value)? light,
    TResult? Function(_DarkTheme value)? dark,
  }) {
    return dark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LightTheme value)? light,
    TResult Function(_DarkTheme value)? dark,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(this);
    }
    return orElse();
  }
}

abstract class _DarkTheme extends ColorSchemeState {
  const factory _DarkTheme({required final ThemeData themeData}) =
      _$DarkThemeImpl;
  const _DarkTheme._() : super._();

  @override
  ThemeData get themeData;

  /// Create a copy of ColorSchemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DarkThemeImplCopyWith<_$DarkThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
