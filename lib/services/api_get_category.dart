import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/response_get_category_screen.dart';

class ApiGetCategory {
  final dio = Dio();
  Future<List<ResponseCategoryModel>> getCategory() async {
    String path = '/category/findMany';
    dio.options.baseUrl = "http://192.168.1.8:5000";
    dio.options.headers["authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NGQ0ODdkZDY5YzUyNjU0MjZiNjYwYTMiLCJ1c2VyTmFtZSI6ImpvbnVkIiwiaWF0IjoxNjkxNjU0OTUzLCJleHAiOjE2OTE2NTg1NTN9.6-L17fPzogPD3MIeCbJgUNzma7Rg1JQyw7YuqO8jNSo";
    try {
      Response res = await dio.get(path);
      print(res.data);
      // Process the response
      if (res.statusCode == 200) {
        List<ResponseCategoryModel> categoryScreen =
            responseCategoryModelFromJson(json.encode(res.data));
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
