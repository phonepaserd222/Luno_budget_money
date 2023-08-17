import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:luno_budget_money/models/response_get_category_expense_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiGetCategoryExpense {
  final dio = Dio();
  Future<List<ResponseGetCategoryExpenseModel>> getCategoryExpense() async {
    String path = ApiConstants.pathGetExpense;
    dio.options.baseUrl = ApiConstants.baseUrl;
    // dio.options.headers["authorization"] = TokenConstants.token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ern sai pref
    String? token = prefs.getString("accessToken");
    dio.options.headers["authorization"] = token;
    //
    try {
      Response res = await dio.get(path);
      if (res.statusCode == 200) {
        List<ResponseGetCategoryExpenseModel> expenseScreen =
            responseGetCategoryExpenseModelFromJson(json.encode(res.data));
        return expenseScreen;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      // print('Error: $error');
      return [];
    }
  }
}
