import 'dart:convert';

List<ResponseGetCategoryExpenseModel> responseGetCategoryExpenseModelFromJson(
        String str) =>
    List<ResponseGetCategoryExpenseModel>.from(json
        .decode(str)
        .map((x) => ResponseGetCategoryExpenseModel.fromJson(x)));

String responseGetCategoryExpenseModelToJson(
        List<ResponseGetCategoryExpenseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseGetCategoryExpenseModel {
  String id;
  DateTime date;
  String title;
  int amount;
  String userId;
  String categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  Category category;

  ResponseGetCategoryExpenseModel({
    required this.id,
    required this.date,
    required this.title,
    required this.amount,
    required this.userId,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.category,
  });

  factory ResponseGetCategoryExpenseModel.fromJson(Map<String, dynamic> json) =>
      ResponseGetCategoryExpenseModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        amount: json["amount"],
        userId: json["userId"],
        categoryId: json["categoryId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        user: User.fromJson(json["User"]),
        category: Category.fromJson(json["Category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "title": title,
        "amount": amount,
        "userId": userId,
        "categoryId": categoryId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "User": user.toJson(),
        "Category": category.toJson(),
      };
}

class Category {
  String categoryName;

  Category({
    required this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
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
