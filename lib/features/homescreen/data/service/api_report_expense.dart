import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/response_get_report_expense_model.dart';

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
    dio.options.queryParameters = {"startDate": startDate, "endDate": endDate};

    try {
      Response res = await dio.get(path);

      if (res.statusCode == 200) {
        List<ResponseGetReportExpenseModel> reportExpense =
            responseGetReportExpenseModelFromJson(json.encode(res.data));
        return reportExpense;
      } else {
        // Handle specific error cases
        if (res.statusCode == 400) {
          // Handle bad request
          throw Exception("Bad request: ${res.statusMessage}");
        } else if (res.statusCode == 401) {
          // Handle unauthorized access
          throw Exception("Unauthorized access: ${res.statusMessage}");
        } else {
          // Handle other error cases
          throw Exception("Failed to load data: ${res.statusMessage}");
        }
      }
    } catch (error) {
      // Handle DioError and other exceptions here
      // print('Error: $error');
      return [];
    }
  }
}
