// import 'dart:convert';

// List<ResponseGetCategoryModel> responseGetCategoryModelFromJson(String str) =>
//     List<ResponseGetCategoryModel>.from(
//         json.decode(str).map((x) => ResponseGetCategoryModel.fromJson(x)));

// String responseGetCategoryModelToJson(List<ResponseGetCategoryModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ResponseGetCategoryModel {
//   String id;
//   String categoryName;
//   String image;
//   String color;
//   String userId;
//   User user;

//   ResponseGetCategoryModel({
//     required this.id,
//     required this.categoryName,
//     required this.image,
//     required this.color,
//     required this.userId,
//     required this.user,
//   });

//   factory ResponseGetCategoryModel.fromJson(Map<String, dynamic> json) =>
//       ResponseGetCategoryModel(
//         id: json["id"],
//         categoryName: json["categoryName"],
//         image: json["image"],
//         color: json["color"],
//         userId: json["userId"],
//         user: User.fromJson(json["User"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "categoryName": categoryName,
//         "image": image,
//         "color": color,
//         "userId": userId,
//         "User": user.toJson(),
//       };
// }

// class User {
//   String userName;

//   User({
//     required this.userName,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         userName: json["userName"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userName": userName,
//       };
// }

import 'dart:convert';

List<ResponseGetCategoryModel> responseGetCategoryModelFromJson(String str) =>
    List<ResponseGetCategoryModel>.from(
        json.decode(str).map((x) => ResponseGetCategoryModel.fromJson(x)));

String responseGetCategoryModelToJson(List<ResponseGetCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseGetCategoryModel {
  String id;
  String categoryName;
  String image;
  String color;
  String userId;

  ResponseGetCategoryModel({
    required this.id,
    required this.categoryName,
    required this.image,
    required this.color,
    required this.userId,
  });

  factory ResponseGetCategoryModel.fromJson(Map<String, dynamic> json) =>
      ResponseGetCategoryModel(
        id: json["id"],
        categoryName: json["categoryName"],
        image: json["image"],
        color: json["color"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "image": image,
        "color": color,
        "userId": userId,
      };
}
