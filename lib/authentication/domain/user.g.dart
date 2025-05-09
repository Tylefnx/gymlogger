// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      token: json['token'] as String,
      username: json['username'] as String,
      email: json['email'] as String?,
      photo_url: json['photo_url'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      sex: json['sex'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
      'email': instance.email,
      'photo_url': instance.photo_url,
      'name': instance.name,
      'surname': instance.surname,
      'sex': instance.sex,
    };
