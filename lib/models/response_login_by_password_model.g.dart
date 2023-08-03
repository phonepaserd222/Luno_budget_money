// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login_by_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLoginByPasswordModel _$ResponseLoginByPasswordModelFromJson(
        Map<String, dynamic> json) =>
    ResponseLoginByPasswordModel(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$ResponseLoginByPasswordModelToJson(
        ResponseLoginByPasswordModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
