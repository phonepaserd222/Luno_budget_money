import 'dart:convert';

ResponseCreateCategoryModel responseCreateCategoryModelFromJson(String str) =>
    ResponseCreateCategoryModel.fromJson(json.decode(str));

String responseCreateCategoryModelToJson(ResponseCreateCategoryModel data) =>
    json.encode(data.toJson());

class ResponseCreateCategoryModel {
  String categoryName;
  String image;

  ResponseCreateCategoryModel({
    required this.categoryName,
    required this.image,
  });

  factory ResponseCreateCategoryModel.fromJson(Map<String, dynamic> json) =>
      ResponseCreateCategoryModel(
        categoryName: json["categoryName"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "image": image,
      };
}
