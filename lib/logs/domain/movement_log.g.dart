// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovementLogImpl _$$MovementLogImplFromJson(Map<String, dynamic> json) =>
    _$MovementLogImpl(
      logs: (json['logs'] as List<dynamic>)
          .map((e) => LiftLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MovementLogImplToJson(_$MovementLogImpl instance) =>
    <String, dynamic>{
      'logs': instance.logs,
    };
