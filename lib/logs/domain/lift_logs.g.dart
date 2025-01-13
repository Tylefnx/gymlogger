// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovementsLogsImpl _$$MovementsLogsImplFromJson(Map<String, dynamic> json) =>
    _$MovementsLogsImpl(
      squat: json['squat'] == null
          ? null
          : MovementLog.fromJson(json['squat'] as Map<String, dynamic>),
      bench: json['bench'] == null
          ? null
          : MovementLog.fromJson(json['bench'] as Map<String, dynamic>),
      deadlift: json['deadlift'] == null
          ? null
          : MovementLog.fromJson(json['deadlift'] as Map<String, dynamic>),
      ohp: json['ohp'] == null
          ? null
          : MovementLog.fromJson(json['ohp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MovementsLogsImplToJson(_$MovementsLogsImpl instance) =>
    <String, dynamic>{
      'squat': instance.squat,
      'bench': instance.bench,
      'deadlift': instance.deadlift,
      'ohp': instance.ohp,
    };
