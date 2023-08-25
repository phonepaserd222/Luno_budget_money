// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/response_refresh_token_model.dart';

class ApiRefreshToken {
  static final dio = Dio();

  static Future<ResponseRefreshTokenModel?> refreshToken() async {
    dio.options.baseUrl = ApiConstants.baseUrl;
    String url = ApiConstants.pathLogIn;
    try {
      Response res = await dio.post(url);
      if (res.statusCode == 200) {
        String accessToken = 'Bearer ${res.data["accessToken"]}';
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("accessToken", accessToken);
        //
        final ResponseRefreshTokenModel data =
            ResponseRefreshTokenModel.fromJson(res.data);

        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
