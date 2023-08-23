import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/response_get_report_expense_model.dart';

class ApiReportExpense {
  final dio = Dio();
  Future<List<ResponseGetReportExpenseModel>> reportExpense({
    required String startDate,
    required String endDate,
  }) async {
    String path = ApiConstants.pathGetReportExpense;
    dio.options.baseUrl = ApiConstants.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    dio.options.headers["authorization"] = token;
    dio.options.queryParameters = {"startDate": startDate, "endDate ": endDate};
    try {
      Response res = await dio.get(
        path,
      );
      if (res.statusCode == 200) {
        List<ResponseGetReportExpenseModel> reportExpense =
            responseGetReportExpenseModelFromJson(json.encode(res.data));
        return reportExpense;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      // print('Error: $error');
      return [];
    }
  }
}
