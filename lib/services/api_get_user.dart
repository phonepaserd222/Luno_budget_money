import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:luno_budget_money/models/response_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiGetUser {
  final dio = Dio();
  Future<ResponseUserModel?> getUser() async {
    dio.options.baseUrl = ApiConstants.baseUrl;
    String path = ApiConstants.pathGetUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    dio.options.headers["authorization"] = token;
    try {
      Response res = await dio.get(path);
      if (res.statusCode == 200) {
        ResponseUserModel user =
            responseUserModelFromJson(json.encode(res.data));
        return user;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      // print('Error: $error');
      // Handle the error appropriately
      return null;
    }
  }
}
