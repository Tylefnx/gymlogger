// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiftLogsImpl _$$LiftLogsImplFromJson(Map<String, dynamic> json) =>
    _$LiftLogsImpl(
      squat: json['Squat'] as Map<String, dynamic>?,
      bench: json['bench press'] as Map<String, dynamic>?,
      deadlift: json['deadlift'] as Map<String, dynamic>?,
      ohp: json['overhead press'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$LiftLogsImplToJson(_$LiftLogsImpl instance) =>
    <String, dynamic>{
      'Squat': instance.squat,
      'bench press': instance.bench,
      'deadlift': instance.deadlift,
      'overhead press': instance.ohp,
    };
