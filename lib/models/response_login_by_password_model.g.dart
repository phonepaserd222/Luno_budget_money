// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login_by_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLoginByPaaswordModel _$ResponseLoginByPaaswordModelFromJson(
        Map<String, dynamic> json) =>
    ResponseLoginByPaaswordModel(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$ResponseLoginByPaaswordModelToJson(
        ResponseLoginByPaaswordModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
