// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predictions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Predictions _$PredictionsFromJson(Map<String, dynamic> json) {
  return _Predictions.fromJson(json);
}

/// @nodoc
mixin _$Predictions {
  List<double> get prediction => throw _privateConstructorUsedError;

  /// Serializes this Predictions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Predictions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictionsCopyWith<Predictions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionsCopyWith<$Res> {
  factory $PredictionsCopyWith(
          Predictions value, $Res Function(Predictions) then) =
      _$PredictionsCopyWithImpl<$Res, Predictions>;
  @useResult
  $Res call({List<double> prediction});
}

/// @nodoc
class _$PredictionsCopyWithImpl<$Res, $Val extends Predictions>
    implements $PredictionsCopyWith<$Res> {
  _$PredictionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Predictions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = null,
  }) {
    return _then(_value.copyWith(
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictionsImplCopyWith<$Res>
    implements $PredictionsCopyWith<$Res> {
  factory _$$PredictionsImplCopyWith(
          _$PredictionsImpl value, $Res Function(_$PredictionsImpl) then) =
      __$$PredictionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> prediction});
}

/// @nodoc
class __$$PredictionsImplCopyWithImpl<$Res>
    extends _$PredictionsCopyWithImpl<$Res, _$PredictionsImpl>
    implements _$$PredictionsImplCopyWith<$Res> {
  __$$PredictionsImplCopyWithImpl(
      _$PredictionsImpl _value, $Res Function(_$PredictionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Predictions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = null,
  }) {
    return _then(_$PredictionsImpl(
      prediction: null == prediction
          ? _value._prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionsImpl extends _Predictions {
  const _$PredictionsImpl({required final List<double> prediction})
      : _prediction = prediction,
        super._();

  factory _$PredictionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionsImplFromJson(json);

  final List<double> _prediction;
  @override
  List<double> get prediction {
    if (_prediction is EqualUnmodifiableListView) return _prediction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prediction);
  }

  @override
  String toString() {
    return 'Predictions(prediction: $prediction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionsImpl &&
            const DeepCollectionEquality()
                .equals(other._prediction, _prediction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_prediction));

  /// Create a copy of Predictions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionsImplCopyWith<_$PredictionsImpl> get copyWith =>
      __$$PredictionsImplCopyWithImpl<_$PredictionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionsImplToJson(
      this,
    );
  }
}

abstract class _Predictions extends Predictions {
  const factory _Predictions({required final List<double> prediction}) =
      _$PredictionsImpl;
  const _Predictions._() : super._();

  factory _Predictions.fromJson(Map<String, dynamic> json) =
      _$PredictionsImpl.fromJson;

  @override
  List<double> get prediction;

  /// Create a copy of Predictions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictionsImplCopyWith<_$PredictionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
