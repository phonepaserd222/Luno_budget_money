import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/api_constants.dart';

class ApiUpdateUser {
  final dio = Dio();
  Future<void> updateUser({
    required String image,
  }) async {
    String path = ApiConstants.pathUpdateUser;
    dio.options.baseUrl = ApiConstants.baseUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    dio.options.headers["authorization"] = token;
    Map<String, dynamic> body = {
      // "date": date,
      "image": image,
    };
    try {
      final response = await dio.patch(path, data: body);

      // Handle the response
      if (response.statusCode == 200) {
        // Data deletion successful
        // print('Data deleted successfully');
      } else {
        // Data deletion failed
        // print('Failed to delete data');
      }
    } catch (e) {
      // Error occurred
      // print('Error: $e');
    }
  }
}
