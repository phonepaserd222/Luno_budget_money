import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_constants.dart';

class ApiUpdateExpense {
  final dio = Dio();
  Future<void> updateExpense({
    required String expenseId,
    required String date,
    required String title,
    required int amount,
    required String categoryId,
  }) async {
    String path = ApiConstants.pathUpdateExpense;
    dio.options.baseUrl = ApiConstants.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    dio.options.headers["authorization"] = token;
    dio.options.queryParameters = {"expenseId": expenseId};
    Map<String, dynamic> body = {
      "date": date,
      "title": title,
      "amount": amount,
      "categoryId": categoryId
    };
    try {
      final response = await dio.patch(path, data: body);

      // Handle the response
      if (response.statusCode == 200) {
        // Data deletion successful
        print('Data deleted successfully');
      } else {
        // Data deletion failed
        print('Failed to delete data');
      }
    } catch (e) {
      // Error occurred
      print('Error: $e');
    }
  }
}
