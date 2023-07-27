import 'package:json_annotation/json_annotation.dart';

part 'response_login_by_password_model.g.dart';

@JsonSerializable()
class ResponseLoginByPaaswordModel {
  @JsonKey(defaultValue: "")
  final String accessToken;
  @JsonKey(defaultValue: "")
  final String refreshToken;

  ResponseLoginByPaaswordModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory ResponseLoginByPaaswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginByPaaswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginByPaaswordModelToJson(this);
}
