// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_routines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRoutinesImpl _$$UserRoutinesImplFromJson(Map<String, dynamic> json) =>
    _$UserRoutinesImpl(
      routine: (json['routine'] as List<dynamic>)
          .map((e) => Routine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserRoutinesImplToJson(_$UserRoutinesImpl instance) =>
    <String, dynamic>{
      'routine': instance.routine,
    };