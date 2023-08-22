import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constants/api_constants.dart';
import '../models/response_register_by_userpass_model.dart';
import '../widget/error_dialog.dart';
import '../widget/loading.dart';

class ApiRegisterByUserpass {
  static final dio = Dio();

  static Future<ResponseRegisterByUserpasswordModel?> registerByUserpass({
    required String userName,
    required String passwords,
    required BuildContext context,
  }) async {
    Loading.show(context);
    dio.options.baseUrl = ApiConstants.baseUrl;
    String path = ApiConstants.pathUserRegister;
    Map<String, String> body = {
      "userName": userName,
      "password": passwords,
    };
    try {
      Response res = await dio.post(path, data: body);
//
      if (res.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Loading.hide(context);
// save token pass pref
        // String accessToken = 'Bearer ${res.data["accessToken"]}';
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString("accessToken", accessToken);
        //
        final ResponseRegisterByUserpasswordModel data =
            ResponseRegisterByUserpasswordModel.fromJson(res.data);
        return data;
      } else {
        // ignore: use_build_context_synchronously
        Loading.hide(context);
        // ignore: use_build_context_synchronously

        return null;
      }
    } catch (e) {
      Loading.hide(context);
      errorDialog(context: context, error: e.toString());
      debugPrint(e.toString());
      return null;
    }
  }
}
