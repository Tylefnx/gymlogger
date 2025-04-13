// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoutineImpl _$$RoutineImplFromJson(Map<String, dynamic> json) =>
    _$RoutineImpl(
      routineName: json['routine_name'] as String,
      exercises: (json['exercises'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, (e as List<dynamic>).map((e) => (e as num).toInt()).toList()),
      ),
    );

Map<String, dynamic> _$$RoutineImplToJson(_$RoutineImpl instance) =>
    <String, dynamic>{
      'routine_name': instance.routineName,
      'exercises': instance.exercises,
    };
