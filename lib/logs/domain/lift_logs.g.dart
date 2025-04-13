// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiftLogImpl _$$LiftLogImplFromJson(Map<String, dynamic> json) =>
    _$LiftLogImpl(
      exercise: json['exercise'] as String,
      age: (json['age'] as num).toInt(),
      bodyweight: (json['bodyweight'] as num).toDouble(),
      date: json['date'] as String,
      sex: json['sex'] as String,
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$$LiftLogImplToJson(_$LiftLogImpl instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'age': instance.age,
      'bodyweight': instance.bodyweight,
      'date': instance.date,
      'sex': instance.sex,
      'weight': instance.weight,
    };
