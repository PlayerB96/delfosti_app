// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialData _$CredentialDataFromJson(Map<String, dynamic> json) =>
    CredentialData(
      user: json['user'] as String,
      password: json['password'] as String,
      rol: json['rol'] as String,
      status: json['status'] as bool,
      code: json['code'] as String,
      business: json['business'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$CredentialDataToJson(CredentialData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'password': instance.password,
      'rol': instance.rol,
      'status': instance.status,
      'code': instance.code,
      'business': instance.business,
      'token': instance.token,
    };
