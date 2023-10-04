import 'dart:convert';

ResponseRefreshTokenModel responseRefreshTokenModelFromJson(String str) =>
    ResponseRefreshTokenModel.fromJson(json.decode(str));

String responseRefreshTokenModelToJson(ResponseRefreshTokenModel data) =>
    json.encode(data.toJson());

class ResponseRefreshTokenModel {
  String newAccessToken;

  ResponseRefreshTokenModel({
    required this.newAccessToken,
  });

  factory ResponseRefreshTokenModel.fromJson(Map<String, dynamic> json) =>
      ResponseRefreshTokenModel(
        newAccessToken: json["newAccessToken"],
      );

  Map<String, dynamic> toJson() => {
        "newAccessToken": newAccessToken,
      };
}
