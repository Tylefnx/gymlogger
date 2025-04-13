// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_log_for_specific_lift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovementLogsForSpecificLiftImpl _$$MovementLogsForSpecificLiftImplFromJson(
        Map<String, dynamic> json) =>
    _$MovementLogsForSpecificLiftImpl(
      lift: json['lift'] as String,
      logs: (json['logs'] as List<dynamic>)
          .map((e) => LiftLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MovementLogsForSpecificLiftImplToJson(
        _$MovementLogsForSpecificLiftImpl instance) =>
    <String, dynamic>{
      'lift': instance.lift,
      'logs': instance.logs,
    };
