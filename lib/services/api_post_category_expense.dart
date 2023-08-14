import 'package:dio/dio.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:luno_budget_money/models/response_create_expense_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiPostCategoryExpense {
  final dio = Dio();
  Future<ResponseCreateExpenseModel?> createExpense(
      {required String date,
      required String title,
      required int amount,
      required String categoryId}) async {
    dio.options.baseUrl = ApiConstants.baseUrl;
    String path = ApiConstants.pathPostExpense;
    Map<String, dynamic> body = {
      "date": date,
      "title": title,
      "amount": amount,
      "categoryId": categoryId,
    };
    try {
      Response res = await dio.post(path, data: body);
      if (res.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString("accessToken");
        dio.options.headers["authorization"] = token;
        final ResponseCreateExpenseModel data =
            ResponseCreateExpenseModel.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
