import 'dart:convert';

import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../models/response_category_model.dart';

class ApiPostCategory {
  static final dio = Dio();
  static Future<ResponseCategoryModel?> createCategory() async {
    dio.options.baseUrl = ApiConstants.baseUrl;
    String url = ApiConstants.postCategory;

    Response res = await dio.get(url);

    if (res.statusCode == 200) {
      ResponseCategoryModel category1 =
          ResponseCategoryModel.fromJson(json.decode(res.data));
      return category1;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
// 
// 


// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:luno_budget_money/constants/api_constants.dart';
// import 'package:luno_budget_money/models/response_category_model.dart';

// import '../widget/error_dialog.dart';
// import '../widget/loading.dart';

// class ApiPostCategory {
//   static final dio = Dio();
//   static Future<ResponseCategoryModel?> postCategory({
//     required String categoryName,
//     required String image,
//     required BuildContext context,
//   }) async {
//     Loading.show(context);
//     dio.options.baseUrl = ApiConstants.baseUrl;
//     String url = ApiConstants.postCategory;
//     Map<String, String> body = {"categoryName": categoryName, "image": image};
//     try {
//       Response res = await dio.post(url, data: body);
//       if (res.statusCode == 200) {
//         Loading.hide(context);

//         final ResponseCategoryModel data =
//             ResponseCategoryModel.fromJson(res.data);
//         return data;
//       } else {
//         Loading.hide(context);
//         errorDialog(context: context, error: "error login");

//         return null;
//       }
//     } catch (e) {
//       Loading.hide(context);
//       errorDialog(context: context, error: e.toString());
//       debugPrint(e.toString());
//       return null;
//     }
//   }
// }
