// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'response_login_by_password_model.g.dart';

@JsonSerializable()
class ResponseLoginByPasswordModel {
  @JsonKey(defaultValue: "")
  final String accessToken;
  @JsonKey(defaultValue: "")
  final String refreshToken;
  ResponseLoginByPasswordModel({
    required this.accessToken,
    required this.refreshToken,
  });
  factory ResponseLoginByPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginByPasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginByPasswordModelToJson(this);
}
