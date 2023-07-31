// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:luno_budget_money/models/expense_model.dart';

part 'response_expense_model.g.dart';

@JsonSerializable()
class ResponseExpenseModel {
  @JsonKey(defaultValue: [])
  final List<ExpenseModel> data;

  ResponseExpenseModel({
    required this.data,
  });

  factory ResponseExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseExpenseModelToJson(this);
}
