// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:luno_budget_money/models/expense_model.dart';

// import '../constants/api_constants.dart';
// import '../models/response_expense_model.dart';

// class ExpenseService {
//   static final dio = Dio();

//   static Future<List<ExpenseModel>> getListExpense() async {
//     dio.options.baseUrl = ApiConstants.baseUrl;
//     String path = ApiConstants.getListExpense;
//     Map<String, String> body = {};
//     try {
//       Response res = await dio.post(path, data: body);
//       if (res.statusCode == 200) {
//         final ResponseExpenseModel data =
//             ResponseExpenseModel.fromJson(res.data);
//         return data.data;
//       } else {
//         return [];
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//       return [];
//     }
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:luno_budget_money/models/category_expense_model.dart';

import '../constants/api_constants.dart';
import '../models/response_expense_model.dart';

import 'package:dio/dio.dart';

class ExpenseService {
  static final dio = Dio();

  static Future<List<ExpenseModel>> saveExpense(
      Map<String, String> body) async {
    dio.options.baseUrl = ApiConstants.baseUrl;
    String path = ApiConstants.getListExpense;
    Map<String, String> body = {};
    try {
      Response res = await dio.post(path, data: body);
      if (res.statusCode == 200) {
        final ResponseExpenseModel data =
            ResponseExpenseModel.fromJson(res.data);
        return data.data;
      } else {
        return []; // Return an empty list when the API call fails
      }
    } catch (e) {
      debugPrint(e.toString());
      return []; // Return an empty list when an exception is caught
    }
  }
}
