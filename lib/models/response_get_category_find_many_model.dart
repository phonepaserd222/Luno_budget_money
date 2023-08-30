import 'dart:convert';

List<ResponseGetCategoryFindManyModel> responseGetCategoryFindManyModelFromJson(
        String str) =>
    List<ResponseGetCategoryFindManyModel>.from(json
        .decode(str)
        .map((x) => ResponseGetCategoryFindManyModel.fromJson(x)));

String responseGetCategoryFindManyModelToJson(
        List<ResponseGetCategoryFindManyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseGetCategoryFindManyModel {
  String id;
  String categoryName;
  String image;
  dynamic color;
  DateTime createdAt;
  DateTime updatedAt;
  String userId;
  User user;

  ResponseGetCategoryFindManyModel({
    required this.id,
    required this.categoryName,
    required this.image,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.user,
  });

  factory ResponseGetCategoryFindManyModel.fromJson(
          Map<String, dynamic> json) =>
      ResponseGetCategoryFindManyModel(
        id: json["id"],
        categoryName: json["categoryName"],
        image: json["image"],
        color: json["color"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        user: User.fromJson(json["User"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "image": image,
        "color": color,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
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
