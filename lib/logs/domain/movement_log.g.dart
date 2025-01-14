// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovementLogImpl _$$MovementLogImplFromJson(Map<String, dynamic> json) =>
    _$MovementLogImpl(
      logs: (json['logs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$MovementLogImplToJson(_$MovementLogImpl instance) =>
    <String, dynamic>{
      'logs': instance.logs,
    };
