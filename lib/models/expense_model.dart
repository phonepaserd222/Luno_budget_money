// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'expense_model.g.dart';

@JsonSerializable()
class ExpenseModel {
  @JsonKey(defaultValue: "")
  final String id;
  @JsonKey(defaultValue: "")
  final String categoryName;
  @JsonKey(defaultValue: "")
  final String image;
  @JsonKey(defaultValue: "")
  final String color;
  @JsonKey(defaultValue: "")
  final String userId;

  ExpenseModel({
    required this.id,
    required this.categoryName,
    required this.image,
    required this.color,
    required this.userId,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);
}
