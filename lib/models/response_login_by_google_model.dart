// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'response_login_by_google_model.g.dart';

@JsonSerializable()
class ResponseLoginGoogleModel {
  @JsonKey(defaultValue: "")
  final String accessToken;
  @JsonKey(defaultValue: "")
  final String refreshToken;

  ResponseLoginGoogleModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory ResponseLoginGoogleModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginGoogleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginGoogleModelToJson(this);
}
