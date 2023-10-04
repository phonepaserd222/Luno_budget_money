import 'dart:convert';

ResponseCreateExpenseModel responseCreateExpenseModelFromJson(String str) =>
    ResponseCreateExpenseModel.fromJson(json.decode(str));

String responseCreateExpenseModelToJson(ResponseCreateExpenseModel data) =>
    json.encode(data.toJson());

class ResponseCreateExpenseModel {
  String date;
  String title;
  int amount;
  String categoryId;

  ResponseCreateExpenseModel({
    required this.date,
    required this.title,
    required this.amount,
    required this.categoryId,
  });

  factory ResponseCreateExpenseModel.fromJson(Map<String, dynamic> json) =>
      ResponseCreateExpenseModel(
        date: json["date"],
        title: json["title"],
        amount: json["amount"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "title": title,
        "amount": amount,
        "categoryId": categoryId,
      };
}
