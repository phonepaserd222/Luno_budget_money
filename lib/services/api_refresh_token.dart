// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/response_refresh_token_model.dart';

class ApiRefreshToken {
  static final dio = Dio();

  Future<ResponseRefreshTokenModel?> refreshToken(
      {required String refreshToken}) async {
    dio.options.baseUrl = ApiConstants.baseUrl;
    String url = ApiConstants.pathRefreshToken;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString("refreshToken");
    dio.options.headers["authorization"] = refreshToken;
    dio.options.queryParameters = {"refreshToken": refreshToken};
    //

    try {
      Response res = await dio.post(url);
      if (res.statusCode == 200) {
        String accessToken = 'Bearer ${res.data["newAccessToken"]}';
        String refreshToken = 'Bearer ${res.data["newRefreshToken"]}';
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("accessToken", accessToken);

        //

        await prefs.setString("refreshToken", refreshToken);
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
