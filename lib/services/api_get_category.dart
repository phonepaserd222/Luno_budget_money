import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/response_get_category_screen.dart';

class ApiGetCategory {
  final dio = Dio();
  Future<List<ResponseGetCategoryModel>> getCategory() async {
    String path = ApiConstants.pathGetCategory;
    dio.options.baseUrl = ApiConstants.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ern sai pref
    String? token = prefs.getString("accessToken");

    dio.options.headers["authorization"] = token;
    try {
      Response res = await dio.get(path);
      // print(res.data);
      // Process the response
      if (res.statusCode == 200) {
        List<ResponseGetCategoryModel> categoryScreen =
            responseGetCategoryModelFromJson(json.encode(res.data));
        return categoryScreen;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      // print('Error: $error');
      // Handle the error appropriately
      return [];
    }
  }
}
