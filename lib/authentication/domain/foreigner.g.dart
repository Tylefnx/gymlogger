// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foreigner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForeignerImpl _$$ForeignerImplFromJson(Map<String, dynamic> json) =>
    _$ForeignerImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      isOnline: json['isOnline'] as bool,
      isFriend: json['isFriend'] as bool,
    );

Map<String, dynamic> _$$ForeignerImplToJson(_$ForeignerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'isOnline': instance.isOnline,
      'isFriend': instance.isFriend,
    };
