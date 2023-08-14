import 'dart:convert';

ResponseUserModel responseUserModelFromJson(String str) =>
    ResponseUserModel.fromJson(json.decode(str));

String responseUserModelToJson(ResponseUserModel data) =>
    json.encode(data.toJson());

class ResponseUserModel {
  String id;
  String googleId;
  String userName;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  ResponseUserModel({
    required this.id,
    required this.googleId,
    required this.userName,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ResponseUserModel.fromJson(Map<String, dynamic> json) =>
      ResponseUserModel(
        id: json["id"],
        googleId: json["googleId"],
        userName: json["userName"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "googleId": googleId,
        "userName": userName,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
