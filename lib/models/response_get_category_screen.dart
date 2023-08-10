import 'dart:convert';

List<ResponseCategoryModel> responseCategoryModelFromJson(String str) =>
    List<ResponseCategoryModel>.from(
        json.decode(str).map((x) => ResponseCategoryModel.fromJson(x)));

String responseCategoryModelToJson(List<ResponseCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseCategoryModel {
  String id;
  String categoryName;
  String image;
  String color;
  String userId;
  User user;

  ResponseCategoryModel({
    required this.id,
    required this.categoryName,
    required this.image,
    required this.color,
    required this.userId,
    required this.user,
  });

  factory ResponseCategoryModel.fromJson(Map<String, dynamic> json) =>
      ResponseCategoryModel(
        id: json["id"],
        categoryName: json["categoryName"],
        image: json["image"],
        color: json["color"],
        userId: json["userId"],
        user: User.fromJson(json["User"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "image": image,
        "color": color,
        "userId": userId,
        "User": user.toJson(),
      };
}

class User {
  String userName;

  User({
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
      };
}
