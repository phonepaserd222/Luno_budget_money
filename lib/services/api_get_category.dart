import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/response_get_category_screen.dart';

class ApiGetCategory {
  final dio = Dio();
  Future<ResponseGetCategoryScreen> getCategory() async {
    String url =
        'http://192.168.1.4:5000/category/findOne?id=64d1f39e1b8bf7641bf972a1';
    Response res = await dio.get(url);

    if (res.statusCode == 200) {
      ResponseGetCategoryScreen categoryScreen =
          ResponseGetCategoryScreen.fromJson(json.decode(res.data));
      return categoryScreen;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
