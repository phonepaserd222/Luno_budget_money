// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login_by_google_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLoginGoogleModel _$ResponseLoginGoogleModelFromJson(
        Map<String, dynamic> json) =>
    ResponseLoginGoogleModel(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$ResponseLoginGoogleModelToJson(
        ResponseLoginGoogleModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
