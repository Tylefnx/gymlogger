// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predictions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionsImpl _$$PredictionsImplFromJson(Map<String, dynamic> json) =>
    _$PredictionsImpl(
      prediction: (json['prediction'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$PredictionsImplToJson(_$PredictionsImpl instance) =>
    <String, dynamic>{
      'prediction': instance.prediction,
    };
