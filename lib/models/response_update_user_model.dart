import 'dart:convert';

ResponseUpdateUserModel responseUpdateUserModelFromJson(String str) =>
    ResponseUpdateUserModel.fromJson(json.decode(str));

String responseUpdateUserModelToJson(ResponseUpdateUserModel data) =>
    json.encode(data.toJson());

class ResponseUpdateUserModel {
  String image;

  ResponseUpdateUserModel({
    required this.image,
  });

  factory ResponseUpdateUserModel.fromJson(Map<String, dynamic> json) =>
      ResponseUpdateUserModel(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
