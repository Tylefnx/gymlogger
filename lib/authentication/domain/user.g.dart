// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      token: json['token'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'name': instance.name,
      'surname': instance.surname,
    };
