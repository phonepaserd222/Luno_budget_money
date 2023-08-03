// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseExpenseModel _$ResponseExpenseModelFromJson(
        Map<String, dynamic> json) =>
    ResponseExpenseModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ExpenseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ResponseExpenseModelToJson(
        ResponseExpenseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
