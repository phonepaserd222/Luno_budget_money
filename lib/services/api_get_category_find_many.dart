import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_constants.dart';
import '../models/response_get_category_find_many_model.dart';

class ApiGetCategoryFindMany {
  final dio = Dio();
  Future<List<ResponseGetCategoryFindManyModel>> getCategoryFindMany() async {
    String path = ApiConstants.pathGetCategory;
    dio.options.baseUrl = ApiConstants.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ern sai pref
    String? accessToken = prefs.getString("accessToken");

    dio.options.headers["authorization"] = accessToken;
    try {
      Response res = await dio.get(path);
      // print(res.data);
      // Process the response
      if (res.statusCode == 200) {
        List<ResponseGetCategoryFindManyModel> categoryScreen =
            responseGetCategoryFindManyModelFromJson(json.encode(res.data));
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
