import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/response_get_category_screen.dart';

class ApiGetCategory {
  final dio = Dio();
  Future<List<ResponseCategoryModel>> getCategory() async {
    String path = '/category/findMany';
    dio.options.baseUrl = "http://192.168.1.8:5000";
    dio.options.headers["authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NGQ0ODdkZDY5YzUyNjU0MjZiNjYwYTMiLCJ1c2VyTmFtZSI6ImpvbnVkIiwiaWF0IjoxNjkxNjUwMDE1LCJleHAiOjE2OTE2NTM2MTV9.v_qTDcKt9xuiZYW1m6s_muYr9OUJ_qekmC_sfU5MzoU";
    try {
      Response res = await dio.get(path);
      print(res.data);
      // Process the response
      if (res.statusCode == 200) {
        List<ResponseCategoryModel> categoryScreen =
            responseCategoryModelFromJson(json.decode(res.data));
        return categoryScreen;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      print('Error: $error');
      // Handle the error appropriately
      return [];
    }
  }
}
