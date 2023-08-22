// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'response_register_by_userpass_model.g.dart';

@JsonSerializable()
class ResponseRegisterByUserpasswordModel {
  @JsonKey(defaultValue: "")
  final String accessToken;
  @JsonKey(defaultValue: "")
  final String refreshToken;
  ResponseRegisterByUserpasswordModel({
    required this.accessToken,
    required this.refreshToken,
  });
  factory ResponseRegisterByUserpasswordModel.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseRegisterByUserpasswordModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ResponseRegisterByUserpasswordModelToJson(this);
}
