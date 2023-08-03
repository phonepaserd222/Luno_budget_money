import 'package:dio/dio.dart';

// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:luno_budget_money/widget/loading.dart';

import '../models/response_login_by_google_model.dart';
import '../widget/error_dialog.dart';

class ApiGoogleLogin {
  static final dio = Dio();

  static Future<ResponseLoginGoogleModel> loginByGoogle({
    required BuildContext context,
  }) async {
    Loading.show(context);
    dio.options.baseUrl = ApiConstants.baseUrl;
    String url = ApiConstants.pathLogInGoogle;
    try {
      Response res = await dio.post(url);
      if (res.statusCode == 200) {
        Loading.hide(context);
      } else {
        Loading.hide(context);
        errorDialog(context: context, error: "error login Google");
      }
    } catch (e) {
      Loading.hide(context);
      errorDialog(context: context, error: e.toString());
      debugPrint(e.toString());
    }
    return loginByGoogle(context: context);
  }
}
