import 'package:dio/dio.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiDeleteExpense {
  final dio = Dio();
  Future<void> deleteData({
    required String id,
  }) async {
    String path = ApiConstants.pathDeleteExpense;
    dio.options.baseUrl = ApiConstants.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    dio.options.headers["authorization"] = token;
    dio.options.queryParameters = {"id": id};
    try {
      final response = await dio.delete(path);

      // Handle the response
      if (response.statusCode == 200) {
        // Data deletion successful
        print('Data deleted successfully');
      } else {
        // Data deletion failed
        print('Failed to delete data');
      }
    } catch (e) {
      // Error occurred
      print('Error: $e');
    }
  }
}
