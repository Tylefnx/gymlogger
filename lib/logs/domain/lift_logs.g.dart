// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiftLogsImpl _$$LiftLogsImplFromJson(Map<String, dynamic> json) =>
    _$LiftLogsImpl(
      squat: (json['Squat'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      bench: (json['Bench Press'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      deadlift: (json['Deadlift'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      ohp: (json['Overhead Press'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$LiftLogsImplToJson(_$LiftLogsImpl instance) =>
    <String, dynamic>{
      'Squat': instance.squat,
      'Bench Press': instance.bench,
      'Deadlift': instance.deadlift,
      'Overhead Press': instance.ohp,
    };
