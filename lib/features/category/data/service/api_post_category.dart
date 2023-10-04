import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/api_constants.dart';
import '../model/response_create_category_model.dart';

class ApiPostCategory {
  static final dio = Dio();
  static Future<ResponseCreateCategoryModel?> createCategory({
    required String categoryName,
    required String image,
  }) async {
    String path = ApiConstants.postCategory;
    dio.options.baseUrl = ApiConstants.baseUrl;
    Map<String, String> body = {
      "categoryName": categoryName,
      "image": image,
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ern sai pref
    String? accessToken = prefs.getString("accessToken");
    dio.options.headers["authorization"] = accessToken;
    Response res = await dio.post(path, data: body);

    if (res.statusCode == 200) {
      ResponseCreateCategoryModel data =
          ResponseCreateCategoryModel.fromJson(json.decode(res.data));

      // print("sc");
      return data;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
